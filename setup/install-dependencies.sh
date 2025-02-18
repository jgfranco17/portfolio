#!/usr/bin/env bash

# Fail-fast options
set -eu
set -o pipefail

# Colors for output
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
NC="\033[0m"  # No Color

echo -e "Checking system dependencies..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Error: Python3 is not installed. Please install it first.${NC}"
    exit 1
else
    echo -e "${GREEN}Python3 is already installed: $(python3 --version)${NC}"
fi

# Check if Poetry is installed
if ! command -v poetry &> /dev/null; then
    echo -e "${YELLOW}Poetry is not installed. Installing now...${NC}"
    curl -sSL https://install.python-poetry.org | python3 -
    export PATH="$HOME/.local/bin:$PATH"
else
    echo -e "${GREEN}Poetry is already installed: $(poetry --version)${NC}"
fi

# Install dependencies
echo -e "Setting up the development environment..."
poetry install

# Verify installation
echo -e "${GREEN}Development setup complete! Launch the dev render with:${NC} just up"
