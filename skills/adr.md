---
description: "Create an Architecture Decision Record for a change or design choice"
allowed-tools: ["Bash(git log:*)", "Bash(ls:*)", "Read", "Write", "Glob"]
---

Create an Architecture Decision Record (ADR) documenting a design or technical decision.

## 1. Find or create the ADR directory

Look for an existing ADR directory: `docs/adr/`, `docs/decisions/`, `adr/`, or similar. If none exists, use `docs/adr/`. Check existing ADRs for numbering and formatting conventions.

## 2. Determine the next ADR number

List existing ADR files, find the highest number, increment by 1. Format: `NNNN` (zero-padded to 4 digits).

## 3. Write the ADR

Create `docs/adr/NNNN-<kebab-case-title>.md` with this structure:

```markdown
# NNNN. <Title>

**Date:** YYYY-MM-DD  
**Status:** Proposed | Accepted | Deprecated | Superseded by [NNNN]

## Context

What is the situation that requires a decision? What constraints, forces, or requirements are at play?

## Decision

What was decided? State it clearly and directly.

## Options Considered

- **Option A** — brief description, pros/cons
- **Option B** — brief description, pros/cons
- *(add more as applicable)*

## Consequences

What becomes easier or harder as a result of this decision? What risks or trade-offs are accepted?

## References

Links to relevant PRs, issues, docs, or prior ADRs.
```

Fill in all sections based on what the user described. Use today's date. Default status to `Accepted` unless told otherwise.

## 4. Confirm

Report the file path created and summarize the decision in one sentence.
