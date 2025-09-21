# Nginx Log Analyzer

This project provides a command-line tool to analyze Nginx access logs. The script reads a log file and provides the following information:

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes
- Top 5 user agents

## Project Structure

```
.
├── analyzer.sh
├── data
│   └── nginx_logs
├── LICENSE
├── README.md
├── requirements.md
├── test_analyzer.sh
└── test_data
    └── test_log.log
```

- `analyzer.sh`: The main script for log analysis.
- `data/nginx_logs`: The sample Nginx log file.
- `test_analyzer.sh`: The test script.
- `test_data/test_log.log`: A smaller log file for testing purposes.

## Usage

To run the log analyzer, execute the `analyzer.sh` script from your terminal:

```bash
./analyzer.sh [path_to_log_file]
```

If no log file path is provided, the script will default to `data/nginx_logs`.

### Example

```bash
./analyzer.sh
```

## Testing

To run the test suite, execute the `test_analyzer.sh` script:

```bash
./test_analyzer.sh
```

The script will run the analyzer against a test log file and verify the output. If all tests pass, you will see an "All tests passed!" message.

## Alternative Implementation

This project also includes an alternative implementation of the log analyzer, `analyzer_alt.sh`. This script uses `sed` and `grep` for data extraction instead of `awk`, demonstrating a different approach to solving the same problem.

To run the alternative script:

```bash
./analyzer_alt.sh [path_to_log_file]
```
