# Ansible Installation Setup

## 2025-01-10: Makefile and Ansible Installation System Ported
**Context:** STORY-001-PRB-007
**Problem:** Need installation system for Gemini CLI like Claude Code has
**Solution:** Ported Make + Ansible installation from Intelligent Claude Code
**Implementation:**
- Makefile with install/uninstall/update/test targets
- ansible/install.yml for idempotent installation
- ansible/uninstall.yml with conservative and force modes
- ansible/test.yml for installation verification

---

## 2025-01-10: Installation Directory Structure
**Context:** STORY-001-PRB-007
**Problem:** Where to install Gemini CLI components
**Solution:** Use ~/.gemini/ as installation target (similar to ~/.claude/)
**Structure:**
```
~/.gemini/
├── behaviors/       # Behavioral patterns
├── roles/          # Role definitions
├── prb-templates/  # PRB templates
├── commands/       # TOML command files
├── memory/         # Learning storage
├── backups/        # Backup directory
├── GEMINI.md       # Main context file
├── settings.json   # Configuration
└── .installed      # Installation marker
```

---
*Installation patterns for Intelligent Gemini CLI*