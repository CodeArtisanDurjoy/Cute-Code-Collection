#!/bin/bash

# Configuration
PATHS="/"
HOSTNAME=$(hostname)
CRITICAL=98
WARNING=90
CRITICAL_MAIL="da-durjoy@outlook.com"
WARNING_MAIL="da-durjoy@outlook.com"
LOG_DIR="/cputilhist"
LOG_FILE="$LOG_DIR/cpusage-$(date +%h%d%y).log"

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"
touch "$LOG_FILE"

# Function to log and send email
log_and_alert() {
    local STATUS=$1
    local CPULOAD=$2
    local EMAIL=$3

    echo "$(date "+%F %H:%M:%S") $STATUS - CPU Load: $CPULOAD on Host: $HOSTNAME" >> "$LOG_FILE"
    echo "$STATUS: CPU Load is $CPULOAD on Host $HOSTNAME" | mail -s "CPU Load Alert: $STATUS" "$EMAIL"
}

# Get CPU Load
CPULOAD=$(top -b -n 2 -d1 | grep "Cpu(s)" | tail -n1 | awk '{print $2}' | awk -F. '{print $1}')

# Check CPU usage and send alerts
if [ "$CPULOAD" -ge "$CRITICAL" ]; then
    log_and_alert "CRITICAL" "$CPULOAD" "$CRITICAL_MAIL"
    exit 2
elif [ "$CPULOAD" -ge "$WARNING" ]; then
    log_and_alert "WARNING" "$CPULOAD" "$WARNING_MAIL"
    exit 1
else
    echo "$(date "+%F %H:%M:%S") OK - CPU Load: $CPULOAD on Host: $HOSTNAME" >> "$LOG_FILE"
    exit 0
fi
