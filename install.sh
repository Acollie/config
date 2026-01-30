#!/bin/bash
# Tmux Configuration Installer
# This script installs TPM (Tmux Plugin Manager) and all plugins

set -e

TMUX_DIR="$HOME/.tmux"
TPM_DIR="$TMUX_DIR/plugins/tpm"

echo "🚀 Installing Tmux Configuration..."
echo ""

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    echo "❌ tmux is not installed. Please install tmux first:"
    echo "   macOS: brew install tmux"
    echo "   Linux: sudo apt-get install tmux"
    exit 1
fi

echo "✓ tmux is installed ($(tmux -V))"

# Install TPM if not already installed
if [ ! -d "$TPM_DIR" ]; then
    echo ""
    echo "📦 Installing TPM (Tmux Plugin Manager)..."
    mkdir -p "$TMUX_DIR/plugins"
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    echo "✓ TPM installed"
else
    echo "✓ TPM already installed"
fi

# Create symlink if main config is in this repo
if [ -f "$TMUX_DIR/tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
    echo ""
    echo "🔗 Creating symlink for tmux.conf..."
    ln -s "$TMUX_DIR/tmux.conf" "$HOME/.tmux.conf"
    echo "✓ Symlink created: ~/.tmux.conf -> ~/.tmux/tmux.conf"
fi

# Install plugins
echo ""
echo "📚 Installing plugins..."
"$TPM_DIR/bin/install_plugins"

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Reload tmux config: tmux source ~/.tmux.conf"
echo "  2. Start a new session: tmux new-session -s work"
echo "  3. Check QUICK_START.md for usage guide"
echo ""
