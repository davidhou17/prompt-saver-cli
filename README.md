# Prompt Saver CLI

A command-line interface for the [prompt-saver-mcp](https://github.com/davidhou17/prompt-saver-mcp) server, built using [mcp-2-cli](https://github.com/davidhou17/mcp-2-cli).

This CLI allows you to interact with your prompt-saver-mcp server directly from the command line, making it easy to save, search, and manage conversation prompts outside of MCP clients.

## Features

- 🔍 **Search prompts** using natural language queries with semantic search
- 💾 **Save conversations** as reusable prompt templates
- 📖 **Get detailed prompt information** including full templates
- ✏️ **Update existing prompts** with manual changes
- 🚀 **Easy CLI interface** with help commands and validation

## Prerequisites

1. **prompt-saver-mcp server** must be installed and configured
   - Location: `/Users/david.hou/Desktop/personal-projects/prompt-saver-mcp`
   - Must be runnable with: `python -m prompt_saver_mcp.server stdio`

2. **Node.js and npm** for running mcp-2-cli
   ```bash
   node --version  # Should be v16+ 
   npm --version
   ```

3. **Python environment** with prompt-saver-mcp dependencies installed

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/davidhou17/prompt-saver-cli.git
   cd prompt-saver-cli
   ```

2. Make the wrapper script executable:
   ```bash
   chmod +x prompt-saver-cli.sh
   ```

3. Test the installation:
   ```bash
   ./prompt-saver-cli.sh --help
   ```

## Usage

### Quick Start

```bash
# Show all available commands
./prompt-saver-cli.sh --help

# Show available tools
./prompt-saver-cli.sh tools --help

# Search for prompts
./prompt-saver-cli.sh tools search_prompts --query "help me with coding"

# Get details for a specific prompt
./prompt-saver-cli.sh tools get_prompt_details --prompt_id "your-prompt-id"
```

### Available Commands

#### 1. Search Prompts
Search for relevant prompts using natural language:

```bash
./prompt-saver-cli.sh tools search_prompts --query "python data analysis" --limit 5
```

#### 2. Save Prompt
Save a conversation as a reusable prompt template:

```bash
./prompt-saver-cli.sh tools save_prompt \
  --conversation_messages '[{"role": "user", "content": "Help me write a Python script"}]' \
  --task_description "Python scripting assistance"
```

#### 3. Get Prompt Details
Retrieve the full template for a specific prompt:

```bash
./prompt-saver-cli.sh tools get_prompt_details --prompt_id "your-prompt-id"
```

#### 4. Update Prompt
Update an existing prompt with changes:

```bash
./prompt-saver-cli.sh tools update_prompt \
  --prompt_id "your-prompt-id" \
  --updates '{"title": "Updated Title", "description": "New description"}'
```

### Command Help

Get help for any specific command:

```bash
./prompt-saver-cli.sh tools search_prompts --help
./prompt-saver-cli.sh tools save_prompt --help
./prompt-saver-cli.sh tools get_prompt_details --help
./prompt-saver-cli.sh tools update_prompt --help
```

## Configuration

The CLI uses `prompt-saver.config.json` to configure how to connect to your MCP server:

```json
{
  "command": "python",
  "args": ["-m", "prompt_saver_mcp.server", "stdio"],
  "transport": "stdio",
  "cliName": "prompt-saver-cli"
}
```

### Customizing the Configuration

If your prompt-saver-mcp is located elsewhere, update the wrapper script:

1. Edit `prompt-saver-cli.sh`
2. Change the `cd` command to point to your server location:
   ```bash
   cd "/path/to/your/prompt-saver-mcp"
   ```

## Use Cases

- **Script Integration**: Use in automation scripts and workflows
- **Agent Skills**: Integrate with Claude Agent Skills
- **Command Line Workflows**: Quick access to prompt management
- **Testing**: Test your MCP server functionality
- **Batch Operations**: Process multiple prompts programmatically

## Troubleshooting

### Common Issues

1. **"Connection closed" error**
   - Ensure prompt-saver-mcp server can run: `python -m prompt_saver_mcp.server stdio`
   - Check that all environment variables are configured
   - Verify database connections are working

2. **"Command not found" error**
   - Make sure you're in the prompt-saver-cli directory
   - Verify the script is executable: `chmod +x prompt-saver-cli.sh`

3. **"Module not found" error**
   - Ensure you're in the correct Python environment
   - Install prompt-saver-mcp dependencies
   - Check the path in the wrapper script

### Manual Usage

If the wrapper script doesn't work, you can run the CLI manually:

```bash
cd /Users/david.hou/Desktop/personal-projects/prompt-saver-mcp
MCP_2_CLI_CONFIG_PATH="/path/to/prompt-saver-cli/prompt-saver.config.json" npx mcp-2-cli tools search_prompts --query "your search"
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

MIT License - see LICENSE file for details

## Related Projects

- [prompt-saver-mcp](https://github.com/davidhou17/prompt-saver-mcp) - The MCP server this CLI wraps
- [mcp-2-cli](https://github.com/davidhou17/mcp-2-cli) - The library used to create this CLI
- [Model Context Protocol](https://modelcontextprotocol.io/) - The protocol specification
