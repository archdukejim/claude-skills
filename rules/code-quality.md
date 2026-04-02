---
description: Code quality and review standards
---

When writing or reviewing code:

- Functions should do one thing. If a function needs a comment to explain what it does, it should probably be split.
- Prefer flat over nested. Early returns reduce nesting; extract helpers for deep branches.
- Name things for what they are, not what they contain (`getUserById` not `fetchData`).
- Delete dead code rather than commenting it out.
- Three similar lines of code is better than a premature abstraction.
