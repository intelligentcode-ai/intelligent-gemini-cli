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

Same as Intelligent Claude Code - see original repository for details.

---
*Intelligent Gemini CLI - Virtual Team for Gemini*