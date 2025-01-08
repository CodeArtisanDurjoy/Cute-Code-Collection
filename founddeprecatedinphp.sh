#!/bin/bash

# Check if a directory is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_php_project>"
    exit 1
fi

# Directory to search
SEARCH_DIR="$1"

# List of known deprecated functions (you can expand this list)
DEPRECATED_FUNCTIONS=(
    "mysql_connect"
    "mysql_query"
    "mysql_fetch_array"
    "mysql_fetch_assoc"
    "mysql_fetch_row"
    "mysql_num_rows"
    "mysql_close"
    "ereg"
    "eregi"
    "split"
    "spliti"
    "session_register"
    "session_unregister"
    "session_is_registered"
    "call_user_method"
    "call_user_method_array"
    "set_magic_quotes_runtime"
    "register_globals"
    "magic_quotes_gpc"
)

# Create a temporary file to store results
TEMP_FILE=$(mktemp)

# Search for deprecated functions in the PHP files
for func in "${DEPRECATED_FUNCTIONS[@]}"; do
    echo "Searching for deprecated function: $func"
    grep -rnw "$SEARCH_DIR" -e "$func" >> "$TEMP_FILE"
done

# Check for @deprecated annotations in comments
echo "Searching for @deprecated annotations"
grep -rnw "$SEARCH_DIR" -e "@deprecated" >> "$TEMP_FILE"

# Display results
if [ -s "$TEMP_FILE" ]; then
    echo "Deprecated functions or methods found:"
    cat "$TEMP_FILE"
else
    echo "No deprecated functions or methods found."
fi

# Clean up
rm "$TEMP_FILE"
