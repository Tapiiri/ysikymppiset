#!/bin/bash

# Initialize variables
DEBUG=0
changed_files=""
tests_to_run=""
ts_files=""

# Function to print debug information
debug() {
  if [ $DEBUG -eq 1 ]; then
    echo "$1"
  fi
}

# Parse input arguments
for arg in "$@"; do
  case $arg in
    --debug)
      DEBUG=1
      ;;
    *)
      ;;
  esac
done

# Load changed files from Git
changed_files=$(git diff --name-only HEAD)
ts_files=$(echo "$changed_files" | grep '\.ts$')

debug "Changed files: $changed_files"
debug "TypeScript files to test: $ts_files"

# Read test dependencies from JSON and find matches
while IFS="=" read -r test_file dependency; do
  debug "Checking test file: $test_file with dependency: $dependency"

  # Check if any changed files match the dependency of the current test file
  if echo "$changed_files" | grep -q "$dependency"; then
    debug "Match found for $test_file due to $dependency"
    tests_to_run="$tests_to_run $test_file"
  fi
done < <(jq -r 'to_entries[] | .key as $key | .value[] | $key + "=" + .' ./tests/test-dependencies.json)

# Combine all the files that need to be tested
all_files_to_test=$(echo "$ts_files $tests_to_run" | xargs)

debug "Tests to run: $tests_to_run"
debug "All files to test: $all_files_to_test"

# Run Jest if there are files to test
if [ -n "$all_files_to_test" ]; then
  echo "Running Jest for the following files: $all_files_to_test"
  npx jest --findRelatedTests $all_files_to_test --testTimeout=120000 --passWithNoTests
else
  echo "No relevant changes detected. Skipping tests."
fi
