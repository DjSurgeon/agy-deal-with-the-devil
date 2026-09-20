#!/bin/sh
set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <target_directory>"
    exit 1
fi

TARGET="$1"

if [ ! -d "$TARGET" ]; then
    echo "Error: Target directory '$TARGET' does not exist."
    exit 1
fi

echo "Installing to $TARGET..."

cp -r .agents/ "$TARGET/"
cp GEMINI.md "$TARGET/"
cp AGENTS.md "$TARGET/"

echo "Successfully installed 'deal-with-the-devil' into $TARGET"
