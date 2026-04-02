#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"
RULES_DIR="$REPO_DIR/rules"
HOOKS_DIR="$REPO_DIR/hooks"
CLAUDE_DIR="$HOME/.claude"
COMMANDS_DIR="$CLAUDE_DIR/commands"
RULES_LINK="$CLAUDE_DIR/rules"
SETTINGS_FILE="$CLAUDE_DIR/settings.json"
CLAUDE_MD_LINK="$CLAUDE_DIR/CLAUDE.md"
UNINSTALL=false

for arg in "$@"; do
    case "$arg" in
        --uninstall) UNINSTALL=true ;;
        *) echo "Unknown argument: $arg"; exit 1 ;;
    esac
done

echo "Claude Skills Installer"
echo "  Repo:     $REPO_DIR"
echo "  Target:   $CLAUDE_DIR"
echo ""

# --- Uninstall ---
if [ "$UNINSTALL" = true ]; then
    _removed=0
    for link in "$COMMANDS_DIR" "$RULES_LINK" "$CLAUDE_MD_LINK"; do
        if [ -L "$link" ]; then
            target="$(readlink "$link")"
            case "$target" in
                "$REPO_DIR"/*|"$REPO_DIR")
                    rm "$link"
                    echo "Removed symlink: $link"
                    _removed=$((_removed + 1))
                    # Restore commands as empty dir so Claude doesn't break
                    if [ "$link" = "$COMMANDS_DIR" ]; then
                        mkdir -p "$COMMANDS_DIR"
                        echo "Restored $COMMANDS_DIR as plain directory"
                    fi
                    ;;
                *)
                    echo "Skipping $link (points to '$target', not this repo)"
                    ;;
            esac
        fi
    done
    if [ "$_removed" -eq 0 ]; then
        echo "Nothing to uninstall."
    fi
    echo "Done."
    exit 0
fi

# --- Install helpers ---

ensure_parent() { mkdir -p "$(dirname "$1")"; }

link_or_skip() {
    local src="$1" dst="$2" label="$3"
    if [ -L "$dst" ]; then
        current="$(readlink "$dst")"
        if [ "$current" = "$src" ]; then
            echo "  Already linked: $label"
            return
        else
            echo "  Warning: $dst already links to '$current'. Skipping $label."
            return
        fi
    fi
    if [ -e "$dst" ]; then
        echo "  Warning: $dst exists and is not a symlink. Skipping $label."
        return
    fi
    ensure_parent "$dst"
    ln -s "$src" "$dst"
    echo "  Linked: $label"
}

# --- Install ---

mkdir -p "$SKILLS_DIR" "$RULES_DIR" "$HOOKS_DIR" "$CLAUDE_DIR"

echo "Linking skills..."
# Migrate any existing plain commands dir
if [ ! -L "$COMMANDS_DIR" ] && [ -d "$COMMANDS_DIR" ]; then
    shopt -s nullglob
    files=("$COMMANDS_DIR"/*)
    if [ ${#files[@]} -gt 0 ]; then
        echo "  Migrating ${#files[@]} existing command(s) into $SKILLS_DIR ..."
        for f in "${files[@]}"; do
            dest="$SKILLS_DIR/$(basename "$f")"
            if [ -e "$dest" ]; then
                echo "    Skip (exists): $(basename "$f")"
            else
                cp -r "$f" "$dest"
                echo "    Copied: $(basename "$f")"
            fi
        done
    fi
    rm -rf "$COMMANDS_DIR"
fi
link_or_skip "$SKILLS_DIR" "$COMMANDS_DIR" "commands -> skills/"

echo "Linking rules..."
link_or_skip "$RULES_DIR" "$RULES_LINK" "rules/"

echo "Linking CLAUDE.md..."
link_or_skip "$REPO_DIR/CLAUDE.md" "$CLAUDE_MD_LINK" "CLAUDE.md"

echo "Deploying settings.json..."
if [ ! -f "$SETTINGS_FILE" ]; then
    cp "$REPO_DIR/settings.json" "$SETTINGS_FILE"
    echo "  Copied settings.json to $SETTINGS_FILE"
else
    echo "  Skipping: $SETTINGS_FILE already exists (edit manually to merge hooks)"
fi

echo ""
echo "Done."
echo "  Skills:    $COMMANDS_DIR -> $SKILLS_DIR"
echo "  Rules:     $RULES_LINK -> $RULES_DIR"
echo "  CLAUDE.md: $CLAUDE_MD_LINK -> $REPO_DIR/CLAUDE.md"
echo "  Settings:  $SETTINGS_FILE"
echo ""
echo "Add hooks in hooks/ and wire them in settings.json."
