#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

echo "Installing Spec-Gantry for Claude Code..."

# 2. Download and extract directly to current directory
curl -sL https://github.com/mppise/spec-gantry--claude/archive/refs/heads/main.tar.gz | tar -xz --strip-components=1


echo -e "${GREEN}Setup complete! Spec-Gantry is now in your project root.${NC}"