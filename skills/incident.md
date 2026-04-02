---
description: "Walk through root cause analysis for a production issue and draft a postmortem"
allowed-tools: ["Bash(git log:*)", "Bash(git diff:*)", "Read", "Glob", "Grep"]
---

Investigate a production incident and produce a root cause analysis and postmortem draft.

## 1. Gather information

Ask for (or use what's provided):
- Error message, stack trace, or log output
- Approximate time of incident
- What changed recently (run `git log --oneline --since="48 hours ago"` if relevant)
- Affected service, endpoint, or component

## 2. Root cause analysis

Work through the evidence systematically:
1. **What happened** — observable symptoms
2. **Why it happened** — trace the causal chain from symptom back to root cause
3. **Why it wasn't caught** — gaps in tests, monitoring, or review
4. **Contributing factors** — anything that made the issue worse or harder to detect

Distinguish between the immediate trigger and the underlying root cause.

## 3. Draft postmortem

Output a structured postmortem:

```markdown
# Incident: <title>

**Date:** YYYY-MM-DD  
**Severity:** P1 / P2 / P3  
**Status:** Resolved | Investigating

## Summary
One paragraph: what happened, impact, how it was resolved.

## Timeline
- HH:MM — event
- HH:MM — event

## Root Cause
Clear statement of the root cause.

## Contributing Factors
- Factor 1
- Factor 2

## What Went Well
- ...

## Action Items
| Item | Owner | Due |
|------|-------|-----|
| ... | ... | ... |
```

Fill in all sections from the evidence. Leave `Owner` and `Due` blank if unknown — flag them as needing assignment.
