#!/bin/bash
# Copyright 2026 Mangesh Pise <mppise@gmail.com>
# Licensed under the Apache License, Version 2.0 (see LICENSE in project root)

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m' 
NC='\033[0m'

# --- Help / Usage Function ---
show_help() {
    echo -e "${GREEN}Usage:${NC} $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --project <name>  Create a new directory with the specified name and install SpecGantry there."
    echo "  -h, --help        Show this help message and exit."
    echo ""
    echo "If no options are provided, the script will install SpecGantry in the current directory"
    echo "after manual confirmation."
    exit 0
}

# --- Argument Parsing ---
PROJECT_NAME=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            ;;
        --project) 
            if [ -n "$2" ]; then
                PROJECT_NAME="$2"
                shift
            else
                echo -e "${YELLOW}Error:${NC} --project requires a name."
                exit 1
            fi
            ;;
        *) echo "Unknown parameter passed: $1"; echo "Use --help for usage."; exit 1 ;;
    esac
    shift
done

# --- Disclaimer & Header (The Entry Point) ---
echo -e "\n${GREEN}============================================================${NC}"
echo -e "${GREEN}    SpecGantry — Spec-Driven Development for Claude Code    ${NC}"
echo -e "${GREEN}============================================================${NC}"
echo -e "${CYAN}Copyright 2026 Mangesh Pise. Licensed under Apache 2.0.${NC}"

echo -e "\n${YELLOW}NOTICE / DISCLAIMER:${NC}"
echo -e "  • Software provided \"AS IS\" without warranty of any kind."
echo -e "  • Claude Code is not included and must be installed separately."
echo -e "  • This is an independent framework; NOT affiliated with Anthropic, PBC."
echo -e "${GREEN}------------------------------------------------------------${NC}\n"

# --- Project Directory Logic ---
if [ -n "$PROJECT_NAME" ]; then
    echo -e "Creating project directory: ${GREEN}$PROJECT_NAME${NC}"
    mkdir -p "$PROJECT_NAME"
    cd "$PROJECT_NAME" || exit
else
    echo -e "${YELLOW}ATTENTION:${NC} No project name provided via --project."
    printf "  Is the current directory ($(pwd)) your project root? [y/N] "
    read -r is_root
    if [ "$is_root" != "y" ] && [ "$is_root" != "Y" ]; then
        echo "  Please run this script from your project root or use --project <name>."
        exit 0
    fi

    echo -e "  ${YELLOW}WARNING:${NC} SpecGantry files will be installed directly into this folder."
    printf "  Continue? [y/N] "
    read -r confirm_install
    if [ "$confirm_install" != "y" ] && [ "$confirm_install" != "Y" ]; then
        echo "  Installation aborted."
        exit 0
    fi
fi

# --- Installation Logic ---
echo -e "Starting installation..."

# 1. Create a temporary workspace
echo -e "${CYAN}  ... Creating temporary workspace${NC}"
TEMP_DIR=$(mktemp -d)

# 2. Download and extract
echo -e "${CYAN}  ... Fetching latest files from GitHub${NC}"
curl -sL https://github.com/mppise/spec-gantry--claude/archive/refs/heads/main.tar.gz | tar -xz -C "$TEMP_DIR" --strip-components=1

# 3. Overwrite core framework files
echo -e "${CYAN}  ... Updating core skills and CLAUDE.md${NC}"
cp -r "$TEMP_DIR/CLAUDE.md" .
mkdir -p .claude
cp -r "$TEMP_DIR/.claude/skills" .claude/ 2>/dev/null || cp -r "$TEMP_DIR/.claude/" .

# 4. Conditionally copy user-editable files
if [ ! -d "SPECS" ]; then
    echo -e "${CYAN}  ... Initializing SPECS directory${NC}"
    cp -r "$TEMP_DIR/SPECS" .
else
    echo -e "  ${GREEN}✓${NC} Existing SPECS directory found (Preserved)"
fi

if [ ! -f "STATUS.md" ]; then
    echo -e "${CYAN}  ... Initializing STATUS.md${NC}"
    cp "$TEMP_DIR/STATUS.md" .
else
    echo -e "  ${GREEN}✓${NC} Existing STATUS.md found (Preserved)"
fi

# 5. Clean up
rm -rf "$TEMP_DIR"

echo -e "\n${GREEN}Setup complete! SpecGantry is now ready in:${NC}"
echo -e "» $(pwd)"

echo -e "\n${YELLOW}NEXT STEPS:${NC}"
echo -e "  1. If you haven't already, install Claude Code:"
echo -e "     ${CYAN}npm install -g @anthropic-ai/claude-code${NC}"
echo -e "  2. Start your session:"
echo -e "     ${CYAN}claude${NC}\n"