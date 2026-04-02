---
description: "Analyze a file or function for complexity and coupling, then propose or apply targeted refactors"
allowed-tools: ["Bash(git diff:*)", "Bash(git log:*)", "Read", "Edit", "Glob", "Grep"]
---

Analyze and refactor the specified file, function, or module.

## 1. Read and understand

Read the target code in full. Also read any files it imports or that import it to understand coupling. Run `git log --oneline -5 -- <file>` to see recent change history.

## 2. Identify issues

Look for:
- **Complexity** — functions doing too many things, deep nesting, long parameter lists
- **Duplication** — repeated logic that could be extracted
- **Coupling** — tight dependencies that make testing or change difficult
- **Naming** — unclear variables, misleading function names
- **Dead code** — unused variables, functions, or branches

Only flag real problems in the existing code. Do not invent requirements or add features.

## 3. Propose refactors

List each issue with:
- **Location** — file and line
- **Problem** — what's wrong and why it matters
- **Proposed fix** — concrete description or code snippet
- **Risk** — low / medium / high (does it change behavior?)

## 4. Apply (if confirmed)

If the user asks you to apply the changes, make edits one logical change at a time. After each edit, note what changed and confirm behavior is preserved. Do not apply all changes at once if any are medium/high risk — check in between.
