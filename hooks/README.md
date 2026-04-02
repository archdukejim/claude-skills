# hooks/

Shell scripts called by Claude Code at lifecycle events, wired up via `settings.json`.

## How hooks work

Each hook is a script that receives a JSON payload on stdin and can:
- **Exit 0** — allow the action; anything on stdout is injected as context
- **Exit 2** — block the action; stderr message is shown to Claude
- **Exit other** — log the error, action proceeds

## Hook events

| Event | When it fires | Common use |
|---|---|---|
| `UserPromptSubmit` | Before every prompt | Inject dynamic context |
| `PreToolUse` | Before any tool runs | Block unsafe commands |
| `PostToolUse` | After any tool runs | Auto-format, lint |
| `Stop` | Claude finishes responding | Notifications, cleanup |
| `SessionStart` | Session opens / after compaction | Re-inject critical context |
| `Notification` | Claude waiting for input | Desktop alerts |
| `CwdChanged` | Working directory changes | Reload env vars (direnv) |

## Wiring a hook

In `settings.json`, add an entry under the relevant event:

```json
"PreToolUse": [
  {
    "matcher": "Bash",
    "hooks": [
      {
        "type": "command",
        "command": "/path/to/hooks/pre-bash.sh"
      }
    ]
  }
]
```

## Adding a hook script

1. Create a script in this directory (bash or any executable)
2. Make it executable: `chmod +x hooks/your-script.sh`
3. Wire it in `settings.json`
4. Run `./install.sh` to deploy updated settings
