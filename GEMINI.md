# GEMINI.md

This file provides guidance to Gemini CLI when working with the Intelligent Gemini CLI system.

## Project Overview

**Intelligent Gemini CLI** transforms Gemini CLI into an intelligent virtual development team with specialized roles, behavioral framework guidance, and PRB-driven execution. This is a port of Intelligent Claude Code adapted for Gemini CLI.

## Common Development Commands

### Virtual Team Interaction
```bash
# Role-based tasks
@PM Build me a [project]     # Start any project with PM coordination
@Architect Design the API    # Request architecture design
@Developer Implement auth    # Assign implementation task
@Security-Engineer Review    # Request security review

# Story Management
@PM break down [story]       # Convert story to PRBs
@PM what story next?         # Select next story with architect
```

### System Commands
```bash
# Configuration
/icc-get-setting [key]       # Get specific configuration value
/icc-load-config            # Reload all configuration files

# Memory Operations
/icc-search-memory [query]   # Search memory for patterns
/icc-store-memory [type] [content]  # Store new memory entity
/icc-memory-status          # Check memory system statistics

# PRB Operations
/icc-create-prb [complexity] # Create new PRB
/icc-analyze-complexity     # Analyze work complexity
```

## High-Level Architecture

### Core Components
1. **Role System**: 14 specialized roles with dynamic specialist creation
2. **PRB Engine**: Product Requirement Blueprint system with 5 complexity tiers
3. **Memory System**: File-based storage with topic organization
4. **Behavioral Patterns**: Enforcement and learning mechanisms
5. **Command System**: TOML-based custom commands

### Directory Structure
```
intelligent-gemini-cli/
├── GEMINI.md                 # Main context file
├── settings.json             # Gemini CLI configuration
├── src/
│   ├── behaviors/           # Behavioral patterns
│   ├── roles/              # Role definitions
│   ├── prb-templates/      # PRB templates
│   └── commands/           # TOML command definitions
├── memory/                  # Learning storage
├── prbs/                    # PRB management
│   ├── ready/              # Ready to execute
│   └── completed/          # Executed PRBs
└── stories/                 # User stories
    └── drafts/             # Work-in-progress stories
```

## Work Guidance

### Key Implementation Notes
1. **TOML Commands**: Commands are defined in ~/.gemini/commands/ as TOML files
2. **Import Syntax**: Use @file.md syntax for modular imports
3. **Role System**: Every @Role mention creates a subagent
4. **PRB Execution**: Single-pass execution with complete context
5. **Memory First**: Check memory before action, store after completion

### System Features
- **Dynamic Specialists**: Auto-create domain experts with 10+ years expertise
- **Learning Culture**: First errors create learnings, repeated errors get penalties
- **Self-Correcting**: Automatic violation detection and correction
- **Story Management**: Natural language stories converted to PRBs

## Configuration

Basic configuration in settings.json:
```json
{
  "theme": "dark",
  "thinkingBudget": 30000,
  "commandsDirectory": "~/.gemini/commands"
}
```

Commands are defined as TOML files in the commands directory.