#!/usr/bin/env bash

# Output file for consolidated configuration
OUTPUT_FILE="apache_combined.conf"

# Apache configuration directories (modify according to your system)
MAIN_CONFIG="/etc/apache2/apache2.conf"  # Ubuntu/Debian
# MAIN_CONFIG="/etc/httpd/conf/httpd.conf"  # CentOS/RHEL

# Clear previous output
> "$OUTPUT_FILE"

# Function to process a configuration file
function process_file()
{
    local file="$1"
    grep -Ev '^\s*#|^\s*$' "$file" >> "$OUTPUT_FILE"
}

# Process the main config file
process_file "$MAIN_CONFIG"

# Find and process all included configuration files
grep -hE "^\s*Include" "$MAIN_CONFIG" | awk '{print $2}' | while read -r config; do
    if [[ -f "$config" ]]
    then
        process_file "$config"
        elif [[ -d "$config" ]]
        then
            find "$config" -type f -name "*.conf" | while read -r subfile; do
                process_file "$subfile"
            done
    fi
done

echo "All Apache configuration files have been consolidated into $OUTPUT_FILE"
