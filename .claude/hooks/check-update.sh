#!/bin/bash
# SpecGantry update checker — runs at SessionStart
# Compares local installed version against latest install.sh on GitHub.
# If a newer version is found, re-runs the installer silently and prompts restart.

REMOTE_URL="https://raw.githubusercontent.com/mppise/spec-gantry--claude/main/install.sh"
LOCAL_VERSION_FILE="$(pwd)/.specgantry_version"

# --- Fetch remote install.sh and extract version ---
REMOTE_SCRIPT=$(curl -sfL --connect-timeout 5 -m 10 "$REMOTE_URL" 2>/dev/null)
if [ -z "$REMOTE_SCRIPT" ]; then
    # No network / repo unreachable — skip silently
    exit 0
fi

REMOTE_VERSION=$(echo "$REMOTE_SCRIPT" | grep -m1 'SPECGANTRY_VERSION=' | sed 's/.*SPECGANTRY_VERSION="\(.*\)"/\1/')
if [ -z "$REMOTE_VERSION" ]; then
    exit 0
fi

# --- Read local version ---
if [ -f "$LOCAL_VERSION_FILE" ]; then
    LOCAL_VERSION=$(cat "$LOCAL_VERSION_FILE")
else
    LOCAL_VERSION="unknown"
fi

# --- Compare ---
if [ "$REMOTE_VERSION" = "$LOCAL_VERSION" ]; then
    exit 0
fi

# --- New version detected: notify only, do not auto-install ---
echo "SpecGantry update available: v${REMOTE_VERSION} (current: v${LOCAL_VERSION}). Run the installer to update: curl -sfL https://raw.githubusercontent.com/mppise/spec-gantry--claude/main/install.sh | bash"
