# Tmux Configuration - Quick Start Guide

## ✅ Installation Complete!

Your tmux configuration is now enhanced with:
- ✓ Powerline theme (Nord color scheme)
- ✓ System stats (CPU, RAM, Battery)
- ✓ Git branch display
- ✓ Session uptime
- ✓ 6 powerful plugins installed
- ✓ Modern key bindings

---

## Starting Tmux

```bash
# Start a new session
tmux new-session -s main

# Or if you have existing sessions
tmux attach
```

## What You Should See

Look at the bottom of your terminal:

```
[main]  Session: 0h 2m  │  [master] ⓒ 32.1%  ⓡ 54.3%  🔋 87%  15:30
```

**Left side:** Session name + uptime
**Right side:** Git branch + CPU + RAM + Battery + Time

---

## Essential Commands (Prefix = Ctrl-b)

### Creating Windows/Panes
| Command | What It Does |
|---------|--------------|
| `Ctrl-b c` | Create new window |
| `Ctrl-b -` | Split pane vertically (top/bottom) |
| `Ctrl-b \|` | Split pane horizontally (left/right) |

### Navigation
| Command | What It Does |
|---------|--------------|
| `Ctrl-b h` | Move left pane |
| `Ctrl-b j` | Move down pane |
| `Ctrl-b k` | Move up pane |
| `Ctrl-b l` | Move right pane |
| `Ctrl-b [` | Scroll up (in pane) |

### Copy/Paste
| Command | What It Does |
|---------|--------------|
| `Ctrl-b Space` | Enter copy mode |
| `Space` (copy mode) | Start selecting text |
| `Enter` (copy mode) | Copy selected text |
| `Ctrl-b p` | Paste text |

### Other
| Command | What It Does |
|---------|--------------|
| `Ctrl-b r` | Reload configuration |
| `Ctrl-b ?` | Show all keybindings |
| `Ctrl-b :` | Enter command mode |

---

## Understanding the Status Bar

**Left side breakdown:**
- `[main]` - Session name
- `Session: 0h 2m` - How long session has been running

**Right side breakdown:**
- `[master]` - Your current git branch (purple text)
- `ⓒ 32.1%` - CPU percentage (circle-C icon)
- `ⓡ 54.3%` - RAM percentage (circle-R icon)
- `🔋 87%` - Battery percentage (battery icon)
- `15:30` - Current time (24-hour format)

---

## Vim Integration (If You Use Vim)

Seamless navigation between vim splits and tmux panes:

```bash
# In vim, press Ctrl-h/j/k/l to move between vim splits AND tmux panes
# Works automatically - no extra config needed!
```

---

## Customization (Edit ~/.tmux.conf)

### Change Colors
Find the "VISUAL THEME" section and edit hex colors:
```tmux
set -g status-bg "#2e3440"    # Background (currently dark gray)
set -g status-fg "#eceff4"    # Text (currently off-white)
```

### Change Prefix Key (Ctrl-b → Ctrl-a)
Uncomment these lines:
```tmux
# set -g prefix C-a
# unbind C-b
# bind C-a send-prefix
```

### Speed Up Refresh (More Responsive)
Change this value (currently 2 = 2 seconds):
```tmux
set -g status-interval 1      # Update every 1 second
```

Then reload: `Ctrl-b r`

---

## Troubleshooting

### Status bar shows weird symbols or raw text
1. Reload config: `Ctrl-b r` (in tmux) or `tmux source ~/.tmux.conf`
2. Kill and restart: `tmux kill-server` then `tmux new-session`

### Git branch not showing in status bar
- Make sure you're in a git repository: `git status`
- Check you're in the right directory: `pwd`

### Battery not showing
- Only shows on laptops/devices with batteries
- If you don't see it, it's working correctly (no battery detected)

### Can't read percentages (text color blends with background)
- You likely need a better terminal font
- Install: `brew install font-fira-code-nerd-font` (macOS)
- Set terminal to use the font and reload config

### Mouse not working
- Should be enabled by default
- Try: `Ctrl-b` then `:set mouse on`
- Reload: `Ctrl-b r`

---

## Next Steps

1. **Use it!** Start creating sessions and panes
2. **Read full guide**: `cat ~/.tmux/CONFIGURATION_GUIDE.md`
3. **Check status bar details**: `cat ~/.tmux/STATUS_BAR_REFERENCE.md`
4. **Customize colors** to match your terminal theme

---

## Useful Links

- **Full Configuration Guide**: See `~/.tmux/CONFIGURATION_GUIDE.md`
- **Status Bar Details**: See `~/.tmux/STATUS_BAR_REFERENCE.md`
- **Implementation Summary**: See `~/.tmux/IMPLEMENTATION_SUMMARY.md`
- **TPM Repository**: https://github.com/tmux-plugins/tpm
- **Tmux Manual**: https://github.com/tmux/tmux/wiki

---

## Pro Tips

✨ **Enable vi mode for faster navigation:**
- Already enabled! Use hjkl in copy mode

✨ **Mouse support:**
- Already enabled! Click to select panes, drag to resize

✨ **Increase history limit:**
- Already set to 10,000 lines (default is 2,000)

✨ **Vi/vim integration:**
- Seamless navigation with vim-tmux-navigator plugin (already installed)

---

## Session Management Commands

```bash
# List all sessions
tmux list-sessions

# Create a named session
tmux new-session -s projectname

# Attach to a session
tmux attach -t projectname

# Kill a session
tmux kill-session -t projectname

# Rename current session (inside tmux)
Ctrl-b + $

# Rename current window (inside tmux)
Ctrl-b + ,
```

---

## Questions?

Check the documentation files in `~/.tmux/`:
- `CONFIGURATION_GUIDE.md` - Detailed feature documentation
- `STATUS_BAR_REFERENCE.md` - Visual layout and color reference
- `IMPLEMENTATION_SUMMARY.md` - What was changed and why
- `QUICK_START.md` - This file!
