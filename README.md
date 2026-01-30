# Tmux Configuration

A modern, feature-rich tmux configuration with powerline theme, system stats, git integration, and plugin management.

## Features

✨ **Modern Powerline Theme** (Nord color scheme)
- Dark, easy-on-the-eyes color palette
- Clean visual hierarchy

📊 **System Stats in Status Bar**
- CPU usage percentage
- RAM usage percentage
- Battery percentage and status
- Real-time updates (every 2 seconds)

🌿 **Git Integration**
- Current branch name displayed
- Updates dynamically as you navigate directories

⏱️ **Session Tracking**
- Session uptime in status bar
- Shows format: "Xh Ym"

🎯 **Vim Integration**
- Seamless navigation between vim and tmux panes
- Ctrl-h/j/k/l works in both vim and tmux

🔌 **Plugin Manager (TPM)**
- 6 carefully selected plugins
- Easy plugin installation and updates

## Quick Start

### Installation

```bash
cd ~/.tmux
bash install.sh
```

This will:
1. Check if tmux is installed
2. Install TPM (Tmux Plugin Manager) if needed
3. Install all required plugins
4. Create necessary symlinks

### After Installation

```bash
# Start a new tmux session
tmux new-session -s work

# Reload config after changes
tmux source ~/.tmux.conf
```

## Status Bar

The status bar displays (bottom of terminal):

```
[main]  Session: 2h 45m  │  [master] CPU:45.2% RAM:62.3% BATT:87% 15:30
```

**Left side:** Session name + uptime
**Right side:** Git branch + CPU + RAM + Battery + Time

## Key Bindings

### Navigation (Prefix = Ctrl-b)

| Key | Action |
|-----|--------|
| `h/j/k/l` | Move between panes (left/down/up/right) |
| `c` | Create new window |
| `-` | Split pane vertically (top/bottom) |
| `\|` | Split pane horizontally (left/right) |
| `r` | Reload configuration |
| `Space` | Enter copy mode |
| `p` | Paste |

### Vim Integration

Use `Ctrl-h/j/k/l` to navigate seamlessly between vim splits and tmux panes.

## Installed Plugins

| Plugin | Purpose |
|--------|---------|
| `tpm` | Plugin Manager |
| `tmux-sensible` | Sensible defaults |
| `tmux-cpu` | CPU/RAM display |
| `tmux-battery` | Battery status |
| `vim-tmux-navigator` | Vim/tmux pane navigation |
| `tmux-prefix-highlight` | Prefix key highlight |

## Documentation

- **QUICK_START.md** - Get started immediately
- **CONFIGURATION_GUIDE.md** - Detailed feature documentation
- **STATUS_BAR_REFERENCE.md** - Visual layout and colors
- **IMPLEMENTATION_SUMMARY.md** - What's included and why

## Customization

### Change Colors

Edit `tmux.conf` and modify hex colors in the "VISUAL THEME" section:

```tmux
set -g status-bg "#2e3440"    # Background
set -g status-fg "#eceff4"    # Text
```

### Change Refresh Rate

Adjust status bar update frequency (currently 2 seconds):

```tmux
set -g status-interval 2      # Change this value
```

### Change Prefix Key

To use Ctrl-a instead of Ctrl-b, uncomment:

```tmux
# set -g prefix C-a
# unbind C-b
# bind C-a send-prefix
```

Then reload: `Ctrl-b r` (in tmux) or `tmux source ~/.tmux.conf`

## Troubleshooting

### Status bar shows broken characters

Your terminal font doesn't support Unicode. Install a Nerd Font:

```bash
# macOS
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font

# Then set your terminal to use the font
```

### Plugins not loading

```bash
# Reinstall plugins
~/.tmux/plugins/tpm/bin/install_plugins

# Or kill and restart tmux
tmux kill-server
tmux new-session
```

### Git branch not showing

- Make sure you're in a git repository: `git status`
- Verify git is installed: `git --version`

### Can't read RAM percentage

- Reload config: `tmux source ~/.tmux.conf`
- Or kill and restart tmux

## File Structure

```
~/.tmux/
├── tmux.conf                    # Main configuration file
├── install.sh                   # Installation script
├── README.md                    # This file
├── QUICK_START.md               # Quick reference guide
├── CONFIGURATION_GUIDE.md       # Detailed documentation
├── STATUS_BAR_REFERENCE.md      # Status bar layout guide
├── IMPLEMENTATION_SUMMARY.md    # Implementation details
├── .gitignore                   # Git ignore rules
└── plugins/                     # TPM plugins directory
    ├── tpm/                     # Tmux Plugin Manager
    ├── tmux-sensible/
    ├── tmux-cpu/
    ├── tmux-battery/
    ├── vim-tmux-navigator/
    └── tmux-prefix-highlight/
```

## Git Workflow

This repository is configured with remote:

```bash
git remote -v
# origin	git@github.com:Acollie/config.git (fetch)
# origin	git@github.com:Acollie/config.git (push)
```

Push your changes:

```bash
cd ~/.tmux
git add tmux.conf
git commit -m "Update tmux configuration"
git push origin main
```

## Requirements

- **tmux** 2.3+ (check with `tmux -V`)
- **git** (for cloning plugins)
- **Nerd Font or Powerline Font** (for proper Unicode display, optional)

## Performance

- **CPU Impact:** Minimal - status updates every 2 seconds
- **Memory:** Negligible - plugins are lightweight
- **Responsiveness:** Improved with vim-tmux-navigator and faster escape times

## References

- [Tmux Official Docs](https://github.com/tmux/tmux/wiki)
- [TPM Repository](https://github.com/tmux-plugins/tpm)
- [Nord Theme](https://www.nordtheme.com/)
- [Google Go Style Guide](https://google.github.io/styleguide/go/) - Config follows similar principles

## License

Your personal configuration. Use and modify as needed.

---

**Installed:** January 30, 2026
**Config Version:** 1.0
**Tmux Minimum Version:** 2.3+
