#!/bin/bash

output=$(node test/unhandled-rejection-diagnostics/index.js 2>&1)
status=$?

if [ "$status" -ne 1 ]; then
    echo "Expected exit status 1, got $status"
    exit 1
fi

echo "$output" | grep -q "diagnosticText" || {
    echo "Expected diagnosticText in unhandled rejection output"
    echo "$output"
    exit 1
}

echo "$output" | grep -q "TS2551" || {
    echo "Expected TypeScript diagnostic in unhandled rejection output"
    echo "$output"
    exit 1
}

if echo "$output" | grep -q "Unhandled asynchronous exception: Unhandled asynchronous exception"; then
    echo "Generic fallback hid the rejection diagnostics"
    echo "$output"
    exit 1
fi
