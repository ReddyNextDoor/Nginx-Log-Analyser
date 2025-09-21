#!/bin/bash

# Set the path to the log file
LOG_FILE=${1:-"data/nginx_logs"}

# Check if the log file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: Log file not found at '$LOG_FILE'" >&2
    exit 1
fi

# --- Top 5 IP addresses with the most requests ---
echo "Top 5 IP addresses with the most requests:"
sed -E 's/^([^ ]+).*/\1/' "$LOG_FILE" | \
    sort | \
    uniq -c | \
    sort -nr | \
    head -n 5 | \
    awk '{print $2 " - " $1 " requests"}'

echo

# --- Top 5 most requested paths ---
echo "Top 5 most requested paths:"
sed -En 's/.*"(GET|POST|PUT|DELETE|HEAD) ([^ ]*).*/\2/p' "$LOG_FILE" | \
    sort | \
    uniq -c | \
    sort -nr | \
    head -n 5 | \
    awk '{print $2 " - " $1 " requests"}'

echo

# --- Top 5 response status codes ---
echo "Top 5 response status codes:"
sed -E 's/^(([^ ]+ ){8}([^ ]+).*)/\3/' "$LOG_FILE" | \
    sort | \
    uniq -c | \
    sort -nr | \
    head -n 5 | \
    awk '{print $2 " - " $1 " requests"}'

echo

# --- Top 5 user agents ---
echo "Top 5 user agents:"
sed -n 's/.*" "\(.*\)"/\1/p' "$LOG_FILE" | \
    sort | \
    uniq -c | \
    sort -nr | \
    head -n 5 | \
    awk '{count=$1; $1=""; print $0 " - " count " requests"}' | sed 's/^ *//'

echo
