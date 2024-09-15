#!/bin/bash

# Load changed files from Git
changed_files=$(git diff --name-only HEAD)

# Initialize lists for test files and TS files to run
tests_to_run=""
ts_files=$(echo "$changed_files" | grep '\.ts$')

echo "Changed files: $changed_files"
echo "TypeScript files to test: $ts_files"

# Debugging output to see which tests are being matched
while IFS="=" read -r test_file dependency; do
  echo "Checking test file: $test_file with dependency: $dependency"

  # Check if any changed files match the dependency of the current test file
  if echo "$changed_files" | grep -q "$dependency"; then
    echo "Match found for $test_file due to $dependency"
    tests_to_run="$tests_to_run $test_file"
  fi
done < <(jq -r 'to_entries[] | .key as $key | .value[] | $key + "=" + .' ./tests/test-dependencies.json)

# Combine all the files that need to be tested
all_files_to_test="$ts_files $tests_to_run"

# Remove all whitespace (spaces, tabs, newlines) from the string
all_files_to_test=$(echo "$all_files_to_test" | xargs)

echo "TypeScript files to test: $ts_files"
echo "Tests to run: $tests_to_run"
echo "All files to test: $all_files_to_test"

# If there are any files to test, run Jest
if [ -n "$all_files_to_test" ]; then
  echo "Running Jest for the following files: $all_files_to_test"
  npx jest --findRelatedTests $all_files_to_test --testTimeout=120000 --passWithNoTests
else
  echo "No relevant changes detected. Skipping tests."
fi
