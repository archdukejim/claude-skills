---
description: "Review recently changed code for bugs, security issues, and style"
allowed-tools: ["Bash(git diff:*)", "Bash(git log:*)", "Read", "Glob", "Grep"]
---

## 1. Identify changed code

Run `git diff HEAD --name-only` to list changed files. For each, run `git diff HEAD -- <file>` to see exactly what changed.

## 2. Review each change

For each changed file, read the full context around the diff and check for:

- **Bugs** — off-by-one errors, null/undefined handling, incorrect logic, unhandled edge cases
- **Security** — command injection, SQL injection, XSS, hardcoded secrets, unsafe deserialization, overly broad permissions
- **Error handling** — missing error checks, swallowed exceptions, silent failures
- **Style** — naming inconsistencies, dead code, unnecessary complexity

Only flag real issues. Do not suggest speculative refactors or nitpick style that matches the surrounding code.

## 3. Report

For each issue found, output:
- **File and line** — where the issue is
- **Severity** — `critical`, `warning`, or `note`
- **Description** — what the problem is and why it matters
- **Suggestion** — a concrete fix (code snippet if helpful)

If no issues are found, say so. End with a one-line summary: total files reviewed, issue count by severity.
