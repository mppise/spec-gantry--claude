#!/bin/bash
# SpecGantry update checker — runs at SessionStart
# Compares local installed version against latest on GitHub.
# If a newer version is found, runs the real installer silently then surfaces a systemMessage.

INSTALL_URL="https://raw.githubusercontent.com/mppise/spec-gantry--claude/main/install.sh"
VERSION_URL="https://raw.githubusercontent.com/mppise/spec-gantry--claude/main/.specgantry_version"
LOCAL_VERSION_FILE="$(pwd)/.specgantry_version"

# --- Fetch remote version number only (lightweight) ---
REMOTE_VERSION=$(curl -sfL --connect-timeout 5 -m 10 "$VERSION_URL" 2>/dev/null | tr -d '[:space:]')
if [ -z "$REMOTE_VERSION" ]; then
    # No network / repo unreachable — skip silently
    exit 0
fi

# --- Read local version ---
if [ -f "$LOCAL_VERSION_FILE" ]; then
    LOCAL_VERSION=$(cat "$LOCAL_VERSION_FILE" | tr -d '[:space:]')
else
    LOCAL_VERSION="unknown"
fi

# --- Compare ---
if [ "$REMOTE_VERSION" = "$LOCAL_VERSION" ]; then
    echo "{\"systemMessage\": \"SpecGantry v${LOCAL_VERSION} is up to date.\"}"
    exit 0
fi

# --- New version detected: run the real installer silently ---
echo "SpecGantry update detected (v${LOCAL_VERSION} → v${REMOTE_VERSION}). Installing..."
curl -sfL --connect-timeout 5 -m 60 "$INSTALL_URL" | bash > /dev/null 2>&1

INSTALL_EXIT=$?
if [ $INSTALL_EXIT -ne 0 ]; then
    echo "{\"systemMessage\": \"ERROR: SpecGantry installer failed (exit code ${INSTALL_EXIT}). Please update manually: curl -sfL ${INSTALL_URL} | bash\"}"
    exit 0
fi

# --- Installation succeeded: surface message cleanly without hook error ---
echo "{\"systemMessage\": \"SpecGantry updated to v${REMOTE_VERSION}. Please restart Claude Code for the new version to take effect.\"}"
exit 0
