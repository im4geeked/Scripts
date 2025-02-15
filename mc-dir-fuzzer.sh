#!/bin/bash

# Function to display script usage
show_help() {
    echo "Usage: $0 <URL> <WORDLIST>"
    echo "   -h, --help     Display this help and exit"
    echo
    echo "This script is a directory fuzzer using ffuf that automatically filters out 4xx and 5xx responses."
}

# Check if the help option is provided
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Check if the required arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Missing arguments."
    show_help
    exit 1
fi

# Assign arguments to variables
URL="$1"
WORDLIST="$2"

# Run ffuf with filtered status codes
ffuf -H "User-Agent: PENTEST" -c -w "$WORDLIST" -u "$URL/FUZZ" -mc 200,201,202,203,204,205,206,207,208,226,300,301,302,303,304,305,306,307,308
