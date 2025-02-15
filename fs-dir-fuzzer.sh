#!/bin/bash

# Function to display script usage
show_help() {
    echo "Usage: $0 <URL> <WORDLIST> <FS Filter>"
    echo "   -h, --help     Display this help and exit"
    echo
    echo "This script is a directory fuzzer using ffuf for those who may forget the syntax."
}

# Check if the help option is provided
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Check if the required arguments are provided
if [ "$#" -ne 3 ]; then
    echo "Error: Missing or incorrect arguments."
    show_help
    exit 1
fi

# Assign arguments to variables
URL="$1"
WORDLIST="$2"
FS="$3"

# Run ffuf command for directory fuzzing
ffuf -H "User-Agent: PENTEST" -c -w "$WORDLIST" -u "$URL/FUZZ" -fs "$FS"
