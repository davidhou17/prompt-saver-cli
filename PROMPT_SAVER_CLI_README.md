# Prompt Saver CLI

This directory contains the CLI wrapper for your prompt-saver-mcp server, created using mcp-2-cli.

## Files Created

- `prompt-saver.config.json` - Configuration file for mcp-2-cli
- `prompt-saver-cli.sh` - Convenient wrapper script to run the CLI
- `PROMPT_SAVER_CLI_README.md` - This documentation file

## Usage

### Quick Start

Use the wrapper script for the easiest experience:

```bash
# Show all available commands
./prompt-saver-cli.sh --help

# Show available tools
./prompt-saver-cli.sh tools --help

# Search for prompts
./prompt-saver-cli.sh tools search_prompts --query "help me with coding"

# Get details for a specific prompt
./prompt-saver-cli.sh tools get_prompt_details --prompt_id "your-prompt-id"

# Save a new prompt
./prompt-saver-cli.sh tools save_prompt --conversation_messages '[{"role": "user", "content": "example message"}]' --task_description "Example task"

# Update an existing prompt
./prompt-saver-cli.sh tools update_prompt --prompt_id "your-prompt-id" --updates '{"title": "New Title"}'
```

### Available Tools

Your prompt-saver-mcp server provides these CLI tools:

1. **save_prompt** - Save conversation as reusable prompt template
2. **search_prompts** - Search for relevant prompts using text or semantic search
3. **get_prompt_details** - Get detailed prompt information including full template
4. **update_prompt** - Update existing prompt with manual changes

### Manual Usage (Alternative)

If you prefer not to use the wrapper script:

```bash
cd /Users/david.hou/Desktop/personal-projects/prompt-saver-mcp
MCP_2_CLI_CONFIG_PATH="/Users/david.hou/Desktop/mcp-2-cli/prompt-saver.config.json" npx mcp-2-cli tools search_prompts --query "your search"
```

## Configuration

The `prompt-saver.config.json` file contains:

```json
{
  "command": "python",
  "args": ["-m", "prompt_saver_mcp.server", "stdio"],
  "transport": "stdio",
  "cliName": "prompt-saver-cli"
}
```

This tells mcp-2-cli how to start your prompt-saver-mcp server.

## Prerequisites

1. Your prompt-saver-mcp server must be properly installed and configured
2. Node.js and npm must be available for running `npx mcp-2-cli`
3. Python environment with prompt-saver-mcp dependencies must be available

## Troubleshooting

- Make sure you're in the correct directory when running commands
- Ensure your prompt-saver-mcp server can run independently: `python -m prompt_saver_mcp.server stdio`
- Check that all environment variables (like database connections) are properly configured
- Verify that the path to your prompt-saver-mcp directory in the wrapper script is correct

## Next Steps

You can now use your prompt-saver-mcp functionality as a CLI tool! This is useful for:

- Integrating with other scripts and automation
- Using in Agent Skills
- Command-line workflows
- Testing your MCP server functionality
