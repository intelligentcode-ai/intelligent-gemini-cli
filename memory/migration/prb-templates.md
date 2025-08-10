# PRB Template Migration

## 2025-01-10: PRB Templates Migrated to Gemini CLI
**Context:** STORY-001-PRB-005
**Problem:** Need PRB templates for Gemini CLI PRB creation
**Solution:** Copied all 5 complexity templates from Intelligent Claude Code
**Details:**
- nano-prb-template.yaml - Trivial changes (0-2 points)
- tiny-prb-template.yaml - Simple tasks (3-5 points)
- medium-prb-template.yaml - Standard features (6-15 points)
- large-prb-template.yaml - Complex features (16-30 points)
- mega-prb-template.yaml - System-wide changes (30+ points)

---

## 2025-01-10: Template Usage in Gemini Commands
**Context:** STORY-001-PRB-005
**Problem:** How to use PRB templates in Gemini TOML commands
**Solution:** Commands can read template files and use them in prompts
**Code:**
```toml
prompt = \"\"\"
Load the appropriate PRB template from src/prb-templates/{complexity}-prb-template.yaml
Fill in the template with the work requirements...
\"\"\"
```

---
*PRB template patterns for Gemini CLI*