#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="$REPO_DIR/skills"
COMMANDS_DIR="$HOME/.claude/commands"

echo "Claude Skills Installer"
echo "  Repo:     $REPO_DIR"
echo "  Skills:   $SKILLS_DIR"
echo "  Commands: $COMMANDS_DIR"
echo ""

# Create skills/ in the repo if it doesn't exist
if [ ! -d "$SKILLS_DIR" ]; then
    mkdir -p "$SKILLS_DIR"
    echo "Created $SKILLS_DIR"
fi

# Check current state of ~/.claude/commands
if [ -L "$COMMANDS_DIR" ]; then
    current_target="$(readlink "$COMMANDS_DIR")"
    if [ "$current_target" = "$SKILLS_DIR" ]; then
        echo "Already linked: $COMMANDS_DIR -> $SKILLS_DIR"
        exit 0
    else
        echo "Error: $COMMANDS_DIR is already a symlink pointing to '$current_target'."
        echo "Remove it manually if you want to relink."
        exit 1
    fi
elif [ -d "$COMMANDS_DIR" ]; then
    # Migrate existing files into skills/
    shopt -s nullglob
    files=("$COMMANDS_DIR"/*)
    if [ ${#files[@]} -gt 0 ]; then
        echo "Migrating ${#files[@]} existing command(s) into $SKILLS_DIR ..."
        for f in "${files[@]}"; do
            dest="$SKILLS_DIR/$(basename "$f")"
            if [ -e "$dest" ]; then
                echo "  Skip (already exists): $(basename "$f")"
            else
                cp -r "$f" "$dest"
                echo "  Copied: $(basename "$f")"
            fi
        done
    fi
    rm -rf "$COMMANDS_DIR"
    echo "Removed original directory: $COMMANDS_DIR"
elif [ -e "$COMMANDS_DIR" ]; then
    echo "Error: $COMMANDS_DIR exists but is not a directory or symlink. Aborting."
    exit 1
fi

# Create the symlink
ln -s "$SKILLS_DIR" "$COMMANDS_DIR"
echo "Linked: $COMMANDS_DIR -> $SKILLS_DIR"
echo ""
echo "Done. Add skill .md files to $SKILLS_DIR and they will appear as Claude commands."
