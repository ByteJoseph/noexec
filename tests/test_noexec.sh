#!/bin/bash

# Setup a fake bin directory and add it to PATH
FAKE_BIN="$(pwd)/fake_bin_test"
mkdir -p "$FAKE_BIN"
cp "$(command -v bash)" "$FAKE_BIN/bash"
export PATH="$FAKE_BIN:$PATH"

NOEXEC="$(pwd)/src/noexec"

# Helper for testing
assert_contains() {
    local output="$1"
    local expected="$2"
    local name="$3"
    if echo "$output" | grep -q "$expected"; then
        echo "PASS: $name"
    else
        echo "FAIL: $name"
        echo "  Expected to contain: $expected"
        echo "  Actual output: $output"
        exit 1
    fi
}

# Test Case 1: Verify successful execution of a simple script passing arguments
echo 'echo "Test Output: $1 $2"' > test_script.sh
chmod +x test_script.sh
OUTPUT=$(bash "$NOEXEC" ./test_script.sh "Arg1" "Arg2")
assert_contains "$OUTPUT" "Test Output: Arg1 Arg2" "Successful execution with arguments"

# Test Case 2: Verify correct output for the --help flag
OUTPUT=$(bash "$NOEXEC" --help)
assert_contains "$OUTPUT" "Usage  : noexec" "Help flag output"

# Test Case 3: Verify error message when the input file does not exist
OUTPUT=$(bash "$NOEXEC" non_existent_file 2>&1)
assert_contains "$OUTPUT" "Error: File 'non_existent_file' doesn't exist." "Missing file error"

# Test Case 4: Verify error message when the input is a directory instead of a file
mkdir -p test_dir
OUTPUT=$(bash "$NOEXEC" test_dir 2>&1)
assert_contains "$OUTPUT" "Error: 'test_dir' is a directory, not a file." "Directory input error"

# Cleanup
rm test_script.sh
rm -rf test_dir
rm -rf "$FAKE_BIN"

echo "All tests passed!"
