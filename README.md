# Intelligent Gemini CLI

A port of [Intelligent Claude Code](https://github.com/intelligentcode-ai/intelligent-claude-code) adapted for Gemini CLI, transforming it into an intelligent virtual development team with 14 specialized roles, behavioral framework guidance, and PRB-driven execution.

## Installation

### Prerequisites
- Node.js and npm
- Gemini CLI
- Ansible (for installation)

### Quick Install
```bash
make install
```

This will:
1. Install all behavioral patterns to `~/.gemini/`
2. Setup TOML commands in `~/.gemini/commands/`
3. Configure settings.json
4. Initialize memory system

### MCP Auto-Installation

The Intelligent Gemini CLI supports automatic installation of Multi-Context Prompts (MCPs) defined in `mcp-manifest.json` at the project root. These MCPs are automatically added to your `~/.gemini/settings.json` file during installation.

To define MCPs for auto-installation, create an `mcp-manifest.json` file in your project's root directory with the following structure:

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

During the installation process (`make install`), the system will check for existing MCPs in `~/.gemini/settings.json` and only install new ones, ensuring idempotency.

### Makefile Parameters for Installation

The `make install` command supports the following optional parameters:

*   `MCP_CONFIG_PATH`: Specifies an external path to a JSON file containing Model Context Protocol (MCP) server configurations for auto-installation. If provided, this file will be used instead of the default `mcp-manifest.json` in the project root.
    **Usage:** `make install MCP_CONFIG_PATH=/path/to/your/mcp-config.json`

*   `API_KEYS_FILE`: Specifies a path to a file containing API keys (e.g., `KEY=VALUE` pairs, one per line) that should be substituted into the installed `settings.json` file. This allows for secure handling of sensitive credentials.
    **Usage:** `make install API_KEYS_FILE=/path/to/your/api-keys.env`

### Uninstall
```bash
# Conservative (preserves user data)
make uninstall

# Complete removal
make uninstall FORCE=true
```

## Features

### Virtual Team System
- **14 Core Roles**: @PM, @Architect, @Developer, @DevOps-Engineer, and more
- **Dynamic Specialists**: Auto-create domain experts for <70% capability matches
- **Role Activation**: Every @Role mention triggers appropriate specialist

### PRB Engine
Product Requirement Blueprints with 5 complexity tiers:
- **Nano (0-2)**: Trivial one-line changes
- **Tiny (3-5)**: Simple single-file tasks
- **Medium (6-15)**: Standard multi-file features
- **Large (16-30)**: Complex features with sub-PRBs
- **Mega (30+)**: System-wide changes

### Memory System
- File-based storage in `memory/` directory
- Topic-based organization
- Learning capture and retrieval
- Pattern recognition and application

### Command System
TOML-based commands in `~/.gemini/commands/`:
- `/create-prb` - Create new PRB
- `/search-memory` - Search learning patterns
- `/analyze-complexity` - Analyze work complexity
- `/break-down-story` - Convert stories to PRBs
- And more...

## Project Structure
```
intelligent-gemini-cli/
├── GEMINI.md                 # Main context file
├── settings.json            # Configuration
├── Makefile                 # Installation system
├── ansible/                 # Ansible playbooks
├── src/
│   ├── behaviors/          # Behavioral patterns
│   ├── roles/             # Role definitions
│   ├── prb-templates/     # PRB templates
│   └── commands/          # TOML commands
├── memory/                 # Learning storage
├── prbs/                   # PRB management
│   ├── ready/             # Ready to execute
│   └── completed/         # Executed PRBs
└── stories/               # User stories
```

## Usage

### Basic Commands
```bash
# Create a PRB
/create-prb Implement user authentication

# Search memory
/search-memory authentication patterns

# Analyze complexity
/analyze-complexity Add OAuth2 integration

# Break down story
/break-down-story STORY-001
```

### Virtual Team Interaction
```bash
# Direct role assignment
@Developer implement the login feature
@PM break down the authentication story
@Architect design the API structure
```

## Configuration

Configuration for the Intelligent Gemini CLI is handled at two levels: global and project-specific.

### Global Configuration (`settings.json`)

Global settings are stored in `settings.json`. These settings apply to all projects unless overridden by a project-level configuration. You can edit `settings.json` to configure:

- Autonomy level (L1/L2/L3)
- Git privacy settings
- Branch protection
- Directory paths
- Command locations

### Project-Specific Configuration (`config.md`)

For project-specific settings, you can create a `config.md` file in the root of your project directory. Settings in this file will override the global settings from `settings.json`.

The format of the `config.md` file is as follows:

```markdown
# Project Configuration

## Setting Name
key: value

## Another Setting
another_key: another_value
```

For example, to set the theme for a specific project, you can create a `config.md` file with the following content:

```markdown
# Project Configuration

## Theme
theme: "light"
```



## Based On

This is a port of [Intelligent Claude Code](https://github.com/intelligentcode-ai/intelligent-claude-code) adapted for Gemini CLI.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
*Intelligent Gemini CLI - Virtual Team for Gemini*