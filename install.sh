#!/bin/bash
# Copyright 2026 Mangesh Pise <mppise@gmail.com>
# Licensed under the Apache License, Version 2.0 (see LICENSE in project root)

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "SpecGantry — Spec-Driven Development for Claude Code"
echo "Copyright 2026 Mangesh Pise. Licensed under Apache 2.0."
echo ""
echo -e "${YELLOW}NOTICE:${NC} SpecGantry is an independent, community-developed framework."
echo "  It is NOT affiliated with, endorsed by, or supported by Anthropic, PBC."
echo "  It contains no Anthropic code or SDK. Claude Code must be installed separately."
echo "  This software is provided AS IS, with no warranty. Use at your own risk."
echo "  See NOTICE, LICENSE, and SECURITY.md after install for full terms."
echo ""

echo "Installing SpecGantry..."

# Warn if CLAUDE.md already exists — this install will overwrite project files
if [ -f "CLAUDE.md" ]; then
  echo ""
  echo -e "${YELLOW}WARNING:${NC} A CLAUDE.md file already exists in this directory."
  echo "  SpecGantry files (CLAUDE.md, .claude/skills/) will be overwritten."
  printf "  Continue? [y/N] "
  read -r confirm
  if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "Install cancelled."
    exit 0
  fi
fi

# Download and extract directly to current directory
curl -sL https://github.com/mppise/spec-gantry--claude/archive/refs/heads/main.tar.gz | tar -xz --strip-components=1


echo -e "${GREEN}Setup complete! Spec-Gantry is now in your project root.${NC}"