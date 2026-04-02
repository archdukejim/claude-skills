---
description: "Generate a Mermaid architecture or sequence diagram from code or a described system"
allowed-tools: ["Bash(git log:*)", "Read", "Glob", "Grep"]
---

Generate a Mermaid diagram for the current project or a described system.

## 1. Determine diagram type

Choose based on the request or codebase:
- **Architecture** (`graph LR/TD`) — system components, services, data flow, dependencies
- **Sequence** (`sequenceDiagram`) — request/response flows, API interactions, event chains
- **Entity-relationship** (`erDiagram`) — data models, schema relationships
- **State** (`stateDiagram-v2`) — lifecycle states, FSMs
- **C4 Context** (`C4Context`) — system boundaries and external actors

If the user specified a type, use it. If not, pick the most useful one for the question.

## 2. Gather context

Read relevant files to understand the system: entry points, config files, service definitions, API routes, data models, infrastructure files (Dockerfile, compose, terraform, etc.). Use `git log --oneline -10` to understand recent structural changes.

## 3. Generate the diagram

Output a fenced Mermaid code block. Keep it readable:
- Group related nodes with `subgraph`
- Label edges meaningfully
- Omit internal implementation details — show boundaries and flows, not line-by-line logic

## 4. Annotate

Below the diagram, add a short legend or bullet list explaining any non-obvious components, abbreviations, or design decisions shown.
