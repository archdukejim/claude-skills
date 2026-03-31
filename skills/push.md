---
description: "Update README, stage and commit all changes, then push to remote"
allowed-tools: ["Bash(git add:*)", "Bash(git status:*)", "Bash(git diff:*)", "Bash(git commit:*)", "Bash(git log:*)", "Bash(git push:*)", "Bash(git remote:*)", "Bash(git branch:*)", "Bash(git rev-parse:*)", "Read", "Write", "Edit", "Glob"]
---

## 1. README

Read README.md and look for a version line at the bottom:
```
<!-- readme-version: <commit-hash> -->
```

If found, run `git log --oneline <hash>..HEAD` to see what changed since the last README update. Use that log to make only targeted updates to affected sections. If the hash is already HEAD, skip the README update and say so.

If no version line exists, write a full README with: **Synopsis** (with Mermaid architecture diagram), **Installation**, **Operations**, **Maintenance**.

After any update, stamp the end of the README with the current HEAD hash:
```
<!-- readme-version: <hash> -->
```

## 2. Commit

1. Run `git status` and `git diff` (including `git diff --cached`) to understand what changed.
2. Run `git log --oneline -5` to match existing commit message style.
3. Stage changes with `git add -u` (or specific files if requested); include the README if it was updated.
4. Write a Conventional Commit message: `<type>: <description>` — imperative mood, under 72 chars, body if warranted.
5. Commit using a heredoc. If nothing to commit, skip and say so.

## 3. Push

1. Confirm a remote exists (`git remote -v`). If none, stop and inform the user.
2. Push with `git push`, or `git push -u origin <branch>` if no upstream is set.
3. Report success or the exact error on failure.

## 4. Suggestions

After a successful push, offer 2–4 concrete next-step suggestions based on the repo state — e.g. open issues, incomplete features from the gap analysis, test coverage, CI setup, or anything else relevant to moving the project forward.
