#!/bin/bash

# Define the output file
OUTPUT_FILE="/opt/usagereport"
HOSTLIST_FILE="/scripts/hostlist"

# Function to collect usage data from a host
collect_usage() {
    local HOST=$1
    local PREFIX=""
    
    if [ "$HOST" == "localhost" ]; then
        PREFIX=""   
    else
        PREFIX="ssh $HOST"
    fi
    
    HOSTNAME=$($PREFIX hostname)
    DATETIME=$($PREFIX date "+%Y-%m-%d %H:%M:%S")
    CPUUSAGE=$($PREFIX top -b -n 2 -d1 | grep "Cpu(s)" | tail -n1 | awk '{print $2}' | awk -F. '{print $1}')
    MEMUSAGE=$($PREFIX free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100.0}')
    DISKUSAGE=$($PREFIX df -P / | awk '/\// {print $5}' | tail -n 1 | sed 's/%//g')
    
    echo "$HOSTNAME, $DATETIME, $CPUUSAGE, $MEMUSAGE, $DISKUSAGE" >> "$OUTPUT_FILE"
}

# Write header to the output file
echo 'HostName, Date&Time, CPU(%), MEM(%), DISK(%)' > "$OUTPUT_FILE"

# Collect usage data for localhost
collect_usage "localhost"

# Collect usage data for remote hosts
if [ -f "$HOSTLIST_FILE" ]; then
    while read -r HOST; do
        [ -z "$HOST" ] && continue # Skip empty lines
        collect_usage "$HOST"
    done < "$HOSTLIST_FILE"
else
    echo "Host list file not found: $HOSTLIST_FILE"
    exit 1
fi

echo "Usage report generated at $OUTPUT_FILE"
