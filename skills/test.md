---
description: "Identify and run tests for recently changed functions"
allowed-tools: ["Bash(git diff:*)", "Bash(git stash:*)", "Bash(npm test:*)", "Bash(pytest:*)", "Bash(go test:*)", "Bash(cargo test:*)", "Bash(ruby:*)", "Bash(php:*)", "Bash(dotnet test:*)", "Read", "Glob", "Grep"]
---

## 1. Identify changed code

Run `git diff HEAD --name-only` to list changed files. For each file, run `git diff HEAD -- <file>` to find the specific functions, methods, or classes that were added or modified.

## 2. Find relevant tests

For each changed function, locate its tests:
- Search for the function name in test files (`*.test.*`, `*.spec.*`, `test_*.py`, `*_test.go`, etc.)
- If no tests exist for a changed function, note it as untested.

## 3. Run the tests

Run only the tests relevant to the changed code using the project's test runner. Scope the run as narrowly as possible (single file or test name filter) rather than the full suite. If no test runner or test files are found, say so.

## 4. Report results

- List each changed function and its test status: **passed**, **failed**, or **no test found**.
- For failures, show the error output.
- For untested functions, suggest what a minimal test should cover.
