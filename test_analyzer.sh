#!/bin/bash

# Path to the analyzer script
ANALYZER_SCRIPT="./analyzer.sh"
# Path to the test log file
TEST_LOG_FILE="test_data/test_log.log"

# Run the analyzer script with the test log file
ACTUAL_OUTPUT=$($ANALYZER_SCRIPT $TEST_LOG_FILE)

# --- Expected Output ---
EXPECTED_OUTPUT=$(cat <<'EOF'
Top 5 IP addresses with the most requests:
1.1.1.1 - 5 requests
2.2.2.2 - 3 requests
6.6.6.6 - 1 requests
5.5.5.5 - 1 requests
4.4.4.4 - 1 requests

Top 5 most requested paths:
/path1 - 4 requests
/path2 - 3 requests
/path3 - 2 requests
/path6 - 1 requests
/path5 - 1 requests

Top 5 response status codes:
200 - 5 requests
404 - 3 requests
500 - 2 requests
401 - 1 requests
304 - 1 requests

Top 5 user agents:
Agent1 - 5 requests
Agent2 - 3 requests
Agent6 - 1 requests
Agent5 - 1 requests
Agent4 - 1 requests
EOF
)

# --- Compare actual and expected output ---
if [ "$ACTUAL_OUTPUT" == "$EXPECTED_OUTPUT" ]; then
    echo "All tests passed!"
    exit 0
else
    echo "Tests failed!"
    echo "--- Expected Output ---"
    echo "$EXPECTED_OUTPUT"
    echo "--- Actual Output ---"
    echo "$ACTUAL_OUTPUT"
    exit 1
fi
