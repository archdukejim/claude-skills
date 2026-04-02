# Claude Code — Global Instructions

This file is loaded into every Claude Code session. Add project-agnostic rules and preferences here.

## General Behavior

- Be concise. Lead with the answer or action, not the reasoning.
- Do not add features, refactors, or comments beyond what was asked.
- Do not create files unless necessary. Prefer editing existing ones.
- Never add error handling for scenarios that can't happen.
- Do not add backwards-compatibility shims for removed code.

## Code Style

- Match the style and conventions of the surrounding code.
- Imperative mood in commit messages and comments ("add" not "added").
- No trailing summaries — the user can read the diff.

## Security

- Never hardcode secrets, tokens, or credentials.
- Validate at system boundaries (user input, external APIs). Trust internal code.
- Flag any potential injection, XSS, or auth issues immediately.

## Git

- Conventional Commits: `<type>: <description>`, under 72 chars, imperative mood.
- Never force-push, never skip hooks (--no-verify), never amend published commits.
- Confirm before any destructive or hard-to-reverse git operation.
