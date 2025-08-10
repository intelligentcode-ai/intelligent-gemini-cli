# Intelligent Gemini CLI Installation Makefile
# Based on Intelligent Claude Code installation system

.PHONY: help install uninstall update test clean check-prereqs

# Default target
help:
	@echo "Intelligent Gemini CLI Installation System"
	@echo ""
	@echo "Available targets:"
	@echo "  make install    - Install Intelligent Gemini CLI system"
	@echo "  make uninstall  - Remove installation (preserves user data)"
	@echo "  make update     - Update to latest version"
	@echo "  make test       - Test installation"
	@echo "  make clean      - Clean temporary files"
	@echo ""
	@echo "Options:"
	@echo "  FORCE=true     - Force uninstall (removes all data)"
	@echo "  VERBOSE=true   - Verbose output"

# Check prerequisites
check-prereqs:
	@echo "Checking prerequisites..."
	@command -v node >/dev/null 2>&1 || { echo "❌ Node.js is required but not installed."; exit 1; }
	@command -v npm >/dev/null 2>&1 || { echo "❌ npm is required but not installed."; exit 1; }
	@command -v ansible-playbook >/dev/null 2>&1 || { echo "❌ Ansible is required but not installed."; exit 1; }
	@echo "✅ All prerequisites installed"

# Install system
install: check-prereqs
	@echo "Installing Intelligent Gemini CLI..."
	@ansible-playbook ansible/install.yml $(if $(VERBOSE),-vv,) $(if $(MCP_CONFIG_PATH),-e mcp_config_path=$(MCP_CONFIG_PATH),)
	@echo "✅ Installation complete!"
	@echo ""
	@echo "Next steps:"
	@echo "1. Restart your terminal or source your shell config"
	@echo "2. Verify installation with: gemini"
	@echo "3. Commands are available in ~/.gemini/commands/"

# Uninstall system (conservative by default)
uninstall:
	@echo "Uninstalling Intelligent Gemini CLI..."
	@if [ "$(FORCE)" = "true" ]; then \
		echo "⚠️  Force uninstall - removing all data"; \
		ansible-playbook ansible/uninstall.yml -e force_removal=true $(if $(VERBOSE),-vv,); \
	else \
		echo "Conservative uninstall - preserving user data"; \
		ansible-playbook ansible/uninstall.yml $(if $(VERBOSE),-vv,); \
	fi
	@echo "✅ Uninstall complete"

# Update system
update: check-prereqs
	@echo "Updating Intelligent Gemini CLI..."
	@git pull origin main
	@ansible-playbook ansible/install.yml --tags update $(if $(VERBOSE),-vv,)
	@echo "✅ Update complete"

# Test installation
test:
	@echo "Testing Intelligent Gemini CLI installation..."
	@ansible-playbook ansible/test.yml $(if $(VERBOSE),-vv,)
	@echo "✅ All tests passed"

# Clean temporary files
clean:
	@echo "Cleaning temporary files..."
	@rm -rf ansible/*.retry
	@rm -rf .tmp/
	@echo "✅ Clean complete"