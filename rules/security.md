---
description: Security standards applied to all code
---

Security rules applied to all code in all projects:

- Never commit secrets, API keys, tokens, or passwords. Use environment variables or a secrets manager.
- Validate and sanitize all external input (user input, API responses, file contents) at the boundary.
- Use parameterized queries — never interpolate user input into SQL or shell commands.
- Flag any OWASP Top 10 issues immediately: injection, broken auth, XSS, insecure deserialization, etc.
- Principle of least privilege: request only the permissions actually needed.
