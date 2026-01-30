# Tmux Status Bar Reference

## Visual Layout

```
┌──────────────────────────────────────────────────────────────────────────────────┐
│ [main]  Session: 2h 45m  │  [master] ⓒ 45.2%  ⓡ 62.3%  🔋 85%  15:30           │
└──────────────────────────────────────────────────────────────────────────────────┘
```

## Left Side Components

### Session Name & Uptime
```
[main]  Session: 2h 45m
│       │           │
│       │           └─ Session uptime (updated every 2 seconds)
│       └───────────── "Session:" label
└───────────────────── Session name (from tmux session)
```

- **Color**: Light text on dark gray background
- **Updates**: Every 2 seconds (as session runs)
- **Prefix Highlight**: Shows red `[CTRL-B]` when you press the prefix key

## Right Side Components

### 1. Git Branch
```
[master]
│
└─ Current git branch name
  - Purple text color
  - Shows "∅" if not in a git repository
  - Updates when you change directories
```

### 2. CPU Usage
```
ⓒ 45.2%
│ │
│ └─ CPU percentage (one or more cores)
└─── CPU indicator (circle-c icon)
```

- **Color**: Light text on dark gray
- **Range**: 0% - 100% (or higher on multi-core systems)
- **Updates**: Every 2 seconds
- **Label**: `ⓒ` = CPU (easier to read than just a percentage)

### 3. RAM Usage
```
ⓡ 62.3%
│ │
│ └─ RAM percentage used (system-wide)
└─── RAM indicator (circle-r icon)
```

- **Color**: Light text, may change based on usage threshold
- **Range**: 0% - 100%
- **Updates**: Every 2 seconds
- **Label**: `ⓡ` = RAM (circle-r clearly distinguishes from CPU)
- **Color Change**: May turn yellow/orange when high, red when very high

### 4. Battery
```
🔋 85%
│  │
│  └─ Battery percentage remaining
└──── Battery icon (shows charge status)
```

- **Color**: Green when charged, Yellow when charging, Red when low
- **Updates**: Every 2 seconds
- **Icon**: Changes based on battery status (🔋 plugged in, 🔌 charging, etc.)
- **Shows**: Only on laptops/devices with batteries

### 5. Time
```
15:30
│
└─ Current time in HH:MM format (24-hour)
```

- **Color**: Light text on dark gray
- **Updates**: Every 2 seconds
- **Format**: 24-hour time (e.g., 15:30 = 3:30 PM)
- **No Date**: Date omitted to save space (use `date` command if needed)

## Color Reference

| Component | Color | Hex Code | Use |
|-----------|-------|----------|-----|
| Background | Dark Gray | #2e3440 | Status bar background |
| Text | Off-white | #eceff4 | Regular text |
| Git Branch | Purple | #b48ead | Git section |
| Battery | Green | #a3be8c | Battery info |
| Active Window | Cyan | #88c0d0 | Current window indicator |
| Border | Subtle Gray | #3b4252 | Pane borders |

## Example Scenarios

### Scenario 1: In a Git Repository
```
[main]  Session: 0h 5m     │  [develop] ⓒ 25.1%  ⓡ 48.7%  🔋 92%  14:23
```
- Session "main" has been running 5 minutes
- Current git branch is "develop"
- CPU at 25%, RAM at 48%, Battery at 92%
- Time is 14:23 (2:23 PM)

### Scenario 2: Not in a Git Repository
```
[work]  Session: 12h 30m   │  ∅ ⓒ 8.5%  ⓡ 71.2%  🔋 45%  09:15
```
- Session "work" has been running 12.5 hours
- Not in a git repository (shows ∅)
- CPU low at 8.5%, RAM high at 71.2%, Battery at 45%
- Time is 09:15 (9:15 AM)

### Scenario 3: High System Load
```
[heavy]  Session: 1h 15m   │  [master] ⓒ 98.3%  ⓡ 89.5%  🔋 20%  18:45
```
- Session "heavy" running for 1.25 hours
- Git branch "master"
- High CPU (98.3%), high RAM (89.5%), low battery (20%)
- Time is 18:45 (6:45 PM)
- Notice color changes: RAM percentage likely showing in red/orange due to high usage

## Reading the Status Bar

### Quick Diagnostics

**Low battery (20-40%):**
```
🔋 35%    ← May show as yellow
```

**Low battery (< 20%):**
```
🔋 15%    ← Shows as red, consider charging
```

**High CPU usage:**
```
ⓒ 85%     ← System is busy
```

**High RAM usage:**
```
ⓡ 85%     ← Consider closing apps or checking `top`
```

**High CPU and RAM:**
```
ⓒ 92%  ⓡ 88%   ← System is under heavy load
```

## Customization Tips

### Want to hide git branch?
Remove this from `~/.tmux.conf`:
```
#(git -C #{pane_current_path} branch --show-current 2>/dev/null || echo '∅')
```

### Want to change time format?
Replace `%H:%M` with:
- `%H:%M:%S` - Include seconds
- `%I:%M %p` - 12-hour format with AM/PM
- `%a %H:%M` - Include day of week

### Want to add date?
Add before the time:
```
%Y-%m-%d %H:%M   ← Shows: 2026-01-30 15:30
```

### Want larger refresh interval?
Change `status-interval`:
```
set -g status-interval 5   ← Update every 5 seconds (less CPU)
set -g status-interval 1   ← Update every 1 second (more CPU)
```

## Troubleshooting Display Issues

### Percentage numbers not aligned
- This is normal - different CPUs show different percentage formats
- Formatting is: `%5.1f%%` (width 5, 1 decimal place)

### Colors look wrong
- Check terminal color support: should be 256-color or truecolor
- Update terminal theme preferences
- Reload config: `Ctrl-b r`

### Icons don't display correctly
- Install a Nerd Font or Powerline font
- Or replace Unicode symbols with ASCII equivalents

### Status bar cuts off
- Increase `status-right-length` value in config
- Currently set to 140 characters
