# MCP Server Configuration

This document provides details on how to configure Multi-Context Prompts (MCP) servers within the Intelligent Gemini CLI system. MCP servers allow the system to interact with external services for specialized prompt generation or processing.

## Configuration Location

MCP server configurations are managed within your `settings.json` file. This can be either the global `~/.gemini/settings.json` or a project-specific `config.md` (if project-level configuration is enabled).

## Configuration Structure

MCP server configurations are defined under the `mcpServers` key in your `settings.json` (or `config.md`) file. Each server is defined as a named object with specific properties:

```json
{
  "mcpServers": {
    "serverName": {
      "command": "path/to/server",
      "args": ["--arg1", "value1"],
      "env": {
        "API_KEY": "$MY_API_TOKEN"
      },
      "cwd": "./server-directory",
      "timeout": 30000,
      "trust": false
    }
  }
}
```

### Properties

*   `serverName`: A unique identifier for your MCP server (e.g., "myCustomPromptServer", "codeGenerationService").
*   `command`: (Required) The absolute path to the executable or script that runs your MCP server.
*   `args`: (Optional) An array of string arguments to pass to the `command`.
*   `env`: (Optional) An object of environment variables to set for the server process. Values can reference existing environment variables using `$VAR_NAME`.
*   `cwd`: (Optional) The current working directory for the server process. Defaults to the project root.
*   `timeout`: (Optional) The maximum time in milliseconds to wait for the server to respond. Defaults to 30000 (30 seconds).
*   `trust`: (Optional) Boolean. If `true`, the system will trust the output of this MCP server without additional validation. Use with caution. Defaults to `false`.

## Example Configuration

Here's an example of how to configure an MCP server in your `settings.json` (or `config.md`):

```json
{
  "mcpServers": {
    "myCodeGenerator": {
      "command": "/usr/local/bin/my-code-gen-server",
      "args": ["--model", "gpt-4", "--temp", "0.7"],
      "env": {
        "API_KEY": "$OPENAI_API_KEY"
      },
      "cwd": "/opt/code-gen-server",
      "timeout": 60000,
      "trust": true
    },
    "localPromptProcessor": {
      "command": "./scripts/local_processor.py",
      "args": ["--verbose"],
      "cwd": "./",
      "timeout": 10000
    }
  }
}
```

## Auto-Installation of MCPs

MCPs can also be automatically installed during the project setup. Refer to the [README.md](../README.md) for details on how to define MCPs for auto-installation using `mcp-manifest.json`.
