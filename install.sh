#!/bin/bash
# Copyright 2026 Mangesh Pise <mppise@gmail.com>
# Licensed under the Apache License, Version 2.0 (see LICENSE in project root)

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m' 
NC='\033[0m'

# --- Disclaimer & Header ---
echo -e "\n${GREEN}============================================================${NC}"
echo -e "${GREEN}    SpecGantry — Spec-Driven Development for Claude Code    ${NC}"
echo -e "${GREEN}============================================================${NC}"
echo -e "${CYAN}Copyright 2026 Mangesh Pise. Licensed under Apache 2.0.${NC}"

echo -e "\n${YELLOW}NOTICE / DISCLAIMER:${NC}"
echo -e "  • Software provided \"AS IS\" without warranty of any kind."
echo -e "  • Claude Code is not included and must be installed separately."
echo -e "  • This is an independent framework; NOT affiliated with Anthropic, PBC."
echo -e "${GREEN}------------------------------------------------------------${NC}\n"

# --- Installation Logic ---
echo -e "Installing SpecGantry in: ${CYAN}$(pwd)${NC}"

# 1. Create a temporary workspace
echo -e "${CYAN}  ... Fetching latest files${NC}"
TEMP_DIR=$(mktemp -d)

# 2. Download and extract
curl -sL https://github.com/mppise/spec-gantry--claude/archive/refs/heads/main.tar.gz | tar -xz -C "$TEMP_DIR" --strip-components=1

# 3. Update core framework files (Overwrite)
echo -e "${CYAN}  ... Updating core skills and CLAUDE.md${NC}"
cp -r "$TEMP_DIR/CLAUDE.md" .
mkdir -p .claude
cp -r "$TEMP_DIR/.claude/skills" .claude/ 2>/dev/null || cp -r "$TEMP_DIR/.claude/" .

# 4. Initialize user files (Preserve if exists)
if [ ! -d "SPECS" ]; then
    echo -e "${CYAN}  ... Initializing SPECS directory${NC}"
    cp -r "$TEMP_DIR/SPECS" .
fi

if [ ! -f "STATUS.md" ]; then
    echo -e "${CYAN}  ... Initializing STATUS.md${NC}"
    cp "$TEMP_DIR/STATUS.md" .
fi

# 5. Clean up
rm -rf "$TEMP_DIR"

echo -e "\n${GREEN}Success! SpecGantry is installed.${NC}"
echo -e "\n${YELLOW}NEXT STEPS:${NC}"
echo -e "  1. Install Claude Code: ${CYAN}npm install -g @anthropic-ai/claude-code${NC}"
echo -e "  2. Run: ${CYAN}claude${NC}\n"