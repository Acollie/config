# Tmux Configuration Guide

## Installation Status
✅ **Complete** - All plugins installed and configured

### Installed Plugins
- **tpm** - Tmux Plugin Manager
- **tmux-sensible** - Sensible defaults for tmux
- **tmux-cpu** - CPU and RAM usage display
- **tmux-battery** - Battery percentage and status
- **vim-tmux-navigator** - Seamless vim/tmux pane navigation
- **tmux-prefix-highlight** - Highlight prefix key when pressed

## Status Bar Features

### Left Side
- **Session Name**: Current tmux session (e.g., "main")
- **Session Uptime**: Time the session has been running (e.g., "2h 15m")
- **Prefix Highlight**: Shows when Ctrl-b is pressed (red highlight)

### Right Side
- **Git Branch**: Current git branch (purple text), or "∅" if not in git repo
- **CPU Usage**: CPU percentage (updates every 2 seconds)
- **RAM Usage**: RAM percentage (updates every 2 seconds)
- **Battery**: Battery percentage with status indicator
- **Time**: Current time in HH:MM format

## Key Bindings

### Navigation (Ctrl-b + key)
| Binding | Action |
|---------|--------|
| `h` / `j` / `k` / `l` | Navigate left/down/up/right pane |
| `Ctrl-h` / `Ctrl-j` / `Ctrl-k` / `Ctrl-l` | Navigate panes (vim-tmux-navigator compatible) |
| `Ctrl-h` / `Ctrl-l` | Switch to previous/next window |

### Window Management
| Binding | Action |
|---------|--------|
| `c` | Create new window in current directory |
| `-` | Split window vertically (new pane below) |
| `\|` | Split window horizontally (new pane right) |
| `r` | Reload tmux configuration |

### Pane Resizing
| Binding | Action |
|---------|--------|
| `H` / `J` / `K` / `L` | Resize pane left/down/up/right (5 units) |
| (hold down for continuous resizing) | Repeat resizing (press multiple times) |

### Copy Mode
| Binding | Action |
|---------|--------|
| `Space` | Enter copy mode |
| `Space` (in copy mode) | Begin selection |
| `Enter` (in copy mode) | Copy selection and exit |
| `p` | Paste buffer |

## Color Scheme (Nord Theme)
- **Background**: Dark gray (#2e3440)
- **Git Branch**: Purple (#b48ead)
- **Battery**: Green (#a3be8c)
- **Active Window**: Cyan (#88c0d0)
- **Status Text**: Off-white (#eceff4)
- **Borders**: Subtle gray (#3b4252)

## Font Requirements
The configuration uses standard Unicode symbols that work in most terminals. If you see broken characters:

### Option 1: Install Nerd Font (Recommended)
```bash
# Using Homebrew
brew tap homebrew/cask-fonts
brew install font-fira-code-nerd-font
# Then set your terminal to use a Nerd Font
```

### Option 2: Install Powerline Font
```bash
git clone https://github.com/powerline/fonts.git ~/powerline-fonts
cd ~/powerline-fonts && ./install.sh
```

## Customization

### Change Color Scheme
Edit `/Users/alexcollie/.tmux.conf` and modify the hex color values in the "VISUAL THEME" section:

```tmux
set -g status-bg "#2e3440"      # Background color
set -g status-fg "#eceff4"      # Text color
```

### Adjust Refresh Interval
Change the status bar refresh rate (currently 2 seconds):

```tmux
set -g status-interval 2
```

Lower values = more responsive, higher CPU usage. Higher values = less CPU, but status updates less frequently.

### Enable Alternative Prefix Key
To use Ctrl-a instead of Ctrl-b:

```tmux
# Uncomment these lines in ~/.tmux.conf:
# set -g prefix C-a
# unbind C-b
# bind C-a send-prefix
```

Then reload config: `Ctrl-b + r`

## Troubleshooting

### Plugins Not Loading
1. Verify TPM is installed: `ls ~/.tmux/plugins/tpm`
2. Reinstall plugins:
   ```bash
   ~/.tmux/plugins/tpm/bin/install_plugins
   ```
3. Reload config: `Ctrl-b + r` (in tmux) or `tmux source ~/.tmux.conf`

### Git Branch Not Showing
- Ensure you're in a directory with a git repository
- Git must be installed: `git --version`
- The branch name appears in purple on the right side

### CPU/RAM/Battery Not Updating
1. Check plugin installation: `ls ~/.tmux/plugins/tmux-cpu` and `ls ~/.tmux/plugins/tmux-battery`
2. Try reloading: `Ctrl-b + r`
3. Kill and restart tmux: `tmux kill-server` then `tmux new-session`

### Broken Characters in Status Bar
- Your font doesn't support Unicode symbols
- Install a Nerd Font or Powerline Font (see Font Requirements above)
- Or edit the status bar format to use simpler characters (e.g., replace `#` with `|`)

## Performance Notes

- **Mouse Support**: Enabled by default (click panes, resize borders)
- **History Limit**: Set to 10,000 lines (increased from default 2,000)
- **Escape Time**: Set to 10ms (faster for vim users)
- **Focus Events**: Enabled for better vim/editor integration

## Useful Commands

### Session Management
```bash
tmux new-session -s main          # Create new session
tmux attach -t main               # Attach to session
tmux kill-session -t main         # Kill session
tmux list-sessions                # List all sessions
```

### Inside Tmux
```bash
Ctrl-b + ?                        # Show all key bindings
Ctrl-b + :                        # Enter command mode
:list-commands                    # List all tmux commands
:show-options -g                  # Show all global options
```

## References

- [Tmux Official Docs](https://github.com/tmux/tmux/wiki)
- [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm)
- [Tmux Sensible Defaults](https://github.com/tmux-plugins/tmux-sensible)
- [Nord Color Scheme](https://www.nordtheme.com/)
