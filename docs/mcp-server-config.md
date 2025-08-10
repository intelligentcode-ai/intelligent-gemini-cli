# MCP Server Configuration

This document provides details on how to configure Model Context Protocol (MCP) servers within the Intelligent Gemini CLI system. MCP servers allow the system to interact with external services for specialized prompt generation or processing.

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

A sample MCP server configuration is available in `mcp-manifest-sample.json` in the project's root directory.

## Auto-Installation of MCPs

Model Context Protocol (MCP) servers can also be automatically installed during the project setup. This process utilizes an optional `mcp-manifest.json` file located at the project root.

If `mcp-manifest.json` is present, the system will read it during installation (`make install`) and add the defined MCPs to your `~/.gemini/settings.json` file. The installation process will check for existing MCPs and only add new ones, ensuring idempotency.

**Important:** The `mcp-manifest.json` file is not created by the system. If this file is not present, the MCP auto-installation step will be skipped. Refer to the [README.md](../README.md) for further details on the structure of `mcp-manifest.json`.
