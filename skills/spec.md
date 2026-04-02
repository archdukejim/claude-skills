---
description: "Turn a feature description or ticket into a structured technical spec"
allowed-tools: ["Bash(git log:*)", "Read", "Write", "Glob", "Grep"]
---

Write a technical spec for the described feature, change, or system.

## 1. Understand the request

Read the feature description provided. If a ticket number or file is mentioned, read it. Check the codebase for relevant existing code — entry points, related modules, current data models — to ground the spec in reality.

## 2. Write the spec

Create or output a spec with these sections:

```markdown
# Spec: <Feature Title>

**Date:** YYYY-MM-DD  
**Status:** Draft | Review | Approved  
**Author:** —

## Problem Statement
What problem does this solve? Why does it matter now?

## Goals
- ...

## Non-Goals
Explicitly state what is out of scope.

## Proposed Approach
How will this be built? Include key design decisions, data flow, and component changes. Add a Mermaid diagram if it helps clarify the design.

## Data Model Changes
Schema additions, migrations, or API contract changes.

## Interface / API Changes
New endpoints, modified signatures, changed CLI flags, etc.

## Edge Cases & Error Handling
- Edge case → how it's handled
- ...

## Open Questions
- [ ] Question that needs a decision before implementation

## Implementation Checklist
- [ ] Step 1
- [ ] Step 2
- [ ] Tests
- [ ] Documentation
```

Fill all sections based on the request and codebase. Be specific about what changes — name files, functions, and tables where known. Flag unknowns as open questions rather than guessing.

## 3. Confirm

After writing, summarize the spec in 2–3 sentences and list any open questions that need answers before work begins.
