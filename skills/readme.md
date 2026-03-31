---
description: "Generate or update a structured README with architecture diagrams and gap analysis"
allowed-tools: ["Bash(git log:*)", "Bash(git rev-parse:*)", "Read", "Write", "Edit", "Glob"]
---

## 1. Check last README update

Read README.md and look for a version line at the bottom in this format:
```
<!-- readme-version: <commit-hash> -->
```

If found, run `git log --oneline <hash>..HEAD` to get only the commits since the last README update. Use this log to scope your changes — only update sections affected by those commits. If the hash is already HEAD, the README is current; say so and stop.

If no version line exists, treat the entire codebase as new and write a full README.

## 2. Write or update README.md

Required sections in order:

1. **Table of Contents** — clickable, at the top.
2. **Synopsis** — one-paragraph summary and a Mermaid.js system architecture diagram.
3. **Installation** — prerequisites and setup steps.
4. **Operations** — usage, CLI commands, core workflows; add Mermaid diagrams for complex flows.
5. **Maintenance** — dependency updates, tests, lifecycle notes.

Only rewrite sections that are affected by the changes since the last update. Leave accurate sections untouched.

## 3. Stamp the version

At the very end of README.md, add or update the version line with the current HEAD commit hash:
```
<!-- readme-version: <hash> -->
```

Run `git rev-parse HEAD` to get the hash. Replace any existing version line.

## 4. Gap analysis

Output a **Gaps & Next Tasks** list of missing files, unimplemented features, or documentation holes found during the update.
