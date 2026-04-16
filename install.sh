#!/bin/bash
# Copyright 2026 Mangesh Pise <mppise@gmail.com>
# Licensed under the Apache License, Version 2.0 (see LICENSE in project root)

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m'

# --- Disclaimer & Header ---
echo -e "\n${GREEN}============================================================${NC}"
echo -e "${GREEN}${BOLD}    SpecGantry — Spec-Driven Development for Claude Code    ${NC}"
echo -e "${GREEN}============================================================${NC}"
echo -e "${CYAN}Copyright 2026 Mangesh Pise. Licensed under Apache 2.0.${NC}"

echo -e "\n${YELLOW}NOTICE / DISCLAIMER:${NC}"
echo -e "  • Software provided \"AS IS\" without warranty of any kind."
echo -e "  • Claude Code is not included and must be installed separately."
echo -e "  • This is an independent framework; NOT affiliated with Anthropic, PBC."
echo -e "${GREEN}------------------------------------------------------------${NC}"

# --- Installation Logic ---
echo -e "\n${BOLD}Target directory:${NC} ${CYAN}$(pwd)${NC}\n"

# 1. Create a temporary workspace
echo -e "[1/4] ${CYAN}Fetching latest release from GitHub...${NC}"
TEMP_DIR=$(mktemp -d)

# 2. Download and extract
if ! curl -sL https://github.com/mppise/spec-gantry--claude/archive/refs/heads/main.tar.gz | tar -xz -C "$TEMP_DIR" --strip-components=1; then
    echo -e "      ${RED}ERROR: Failed to download SpecGantry. Check your internet connection and try again.${NC}\n"
    rm -rf "$TEMP_DIR"
    exit 1
fi
echo -e "      ${GREEN}Done.${NC}"

# 3. Update core framework files (Overwrite)
echo -e "\n[2/4] ${CYAN}Installing core framework files...${NC}"
cp -r "$TEMP_DIR/CLAUDE.md" .
cp -r "$TEMP_DIR/README.md" .
cp -r "$TEMP_DIR/CONTRIBUTING.md" .
cp -r "$TEMP_DIR/SECURITY.md" .
cp -r "$TEMP_DIR/NOTICE" .
cp -r "$TEMP_DIR/LICENSE" .
mkdir -p .claude
cp -r "$TEMP_DIR/.claude/." .claude/
echo -e "      ${GREEN}CLAUDE.md, skills, and supporting files updated.${NC}"

# 4. Initialize user files (Preserve if exists)
echo -e "\n[3/4] ${CYAN}Checking for existing project files...${NC}"

if [ ! -d "SPECS" ]; then
    cp -r "$TEMP_DIR/SPECS" .
    echo -e "      ${GREEN}SPECS/ directory created with starter templates.${NC}"
else
    echo -e "      ${YELLOW}SPECS/ already exists — skipped to preserve your work.${NC}"
fi

if [ ! -f "STATUS.md" ]; then
    cp "$TEMP_DIR/STATUS.md" .
    echo -e "      ${GREEN}STATUS.md initialized.${NC}"
else
    echo -e "      ${YELLOW}STATUS.md already exists — skipped to preserve your work.${NC}"
fi

# 5. Clean up
echo -e "\n[4/4] ${CYAN}Cleaning up temporary files...${NC}"
rm -rf "$TEMP_DIR"
echo -e "      ${GREEN}Done.${NC}"

# --- Success ---
echo -e "\n${GREEN}============================================================${NC}"
echo -e "${GREEN}${BOLD}  SpecGantry installed successfully!${NC}"
echo -e "${GREEN}============================================================${NC}"
echo -e "\n${YELLOW}${BOLD}NEXT STEPS:${NC}"
echo -e "  1. Install Claude Code (if not already):  ${CYAN}npm install -g @anthropic-ai/claude-code${NC}"
echo -e "  2. Start a session in this directory:     ${CYAN}claude${NC}"
echo -e "  3. Begin your first project with:         ${CYAN}/ideate${NC}"
echo -e "\n${CYAN}Documentation: https://github.com/mppise/spec-gantry--claude${NC}\n"
