#!/bin/bash

# Wrapper script for prompt-saver-mcp CLI
# This script sets up the environment and runs the CLI with the correct configuration

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Set the config path
export MCP_2_CLI_CONFIG_PATH="$SCRIPT_DIR/prompt-saver.config.json"

# Change to the prompt-saver-mcp directory to ensure proper Python module resolution
cd "/Users/david.hou/Desktop/personal-projects/prompt-saver-mcp"

# Run the CLI with all passed arguments
npx mcp-2-cli "$@"
