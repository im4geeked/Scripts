# FFUF Wrapper Script

## Description
This script is a simple wrapper for `ffuf` that simplifies the process of fuzzing virtual hosts and directories. It provides pre-configured wordlists and common options while allowing customization when needed.

## Features
- Two fuzzing modes: vhost and directory
- Pre-configured wordlists (can be changed in the script)
- Customizable file extensions
- File size filtering
- Handles common HTTP response codes (200, 301, 302, 307, 401, 403)

## Usage
```
./fuzz.py [mode] -u URL [options]
```

### Modes
- `vhost`: Fuzz for virtual hosts
- `dir`: Fuzz for directories and files

### Options
| Option | Description | Example |
|--------|-------------|---------|
| `-u`, `--url` | Target URL (without http://) (required) | example.com |
| `-e`, `--fs-filter` | File size filter | 42 or 100-200 |
| `-x`, `--extensions` | File extensions to fuzz (comma-separated) | .php,.txt,.html |

## Examples
1. Fuzz vhosts:
```
./ffuf_wrapper.py vhost -u example.com -x .php,.html -e 42
```

2. Fuzz directories:
```
./ffuf_wrapper.py dir -u example.com
```

## Requirements
- Python 3
- ffuf installed and in PATH
- Wordlists (paths can be modified in the script)

## Note
Before using, you should modify the wordlist paths in the script to point to your actual wordlist locations i.e `/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt`:
- `~/tools/wordlists/subdomains-top1million-5000.txt` for vhost mode
- `~/tools/wordlists/directory-list-2.3-medium.txt` for directory mode
