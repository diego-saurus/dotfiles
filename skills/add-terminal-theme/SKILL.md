---
name: add-terminal-theme
description: Use when the user wants Ghostty and/or the oh-my-zsh prompt to match a Neovim NvChad base46 theme (e.g. "rxyhn", "chadracula", "onedark"), or asks to theme the terminal from their nvim colors. Argument is the base46 theme name.
argument-hint: <base46-theme-name>
---

# Terminal theme from base46

## Overview
One script turns an NvChad base46 theme into a Ghostty theme file plus an oh-my-zsh theme, both named after the base46 theme. Colors are used exactly as base46 defines them.

## Run

```bash
python3 -I ./skills/add-terminal-theme/scripts/base46_term.py <theme>
```

Writes:
- `~/.config/ghostty/themes/<theme>`
- `~/.config/omz/themes/<theme>.zsh-theme`

Activates (skip with `--no-activate`):
- `theme = <theme>` in `~/.config/dotfiles/ghostty/config`, and removes any `minimum-contrast` line
- `ZSH_THEME="<theme>"` in `~/.config/dotfiles/omz/custom.zsh`

It prints the 16 palette colors. Show them to the user.

## Color mapping

| ANSI | base46 key | bright ANSI | base46 key |
|---|---|---|---|
| 0 black | `one_bg` | 8 | `light_grey` |
| 1 red | `red` | 9 | `baby_pink` |
| 2 green | `green` | 10 | `vibrant_green` |
| 3 yellow | `yellow` | 11 | `sun` |
| 4 blue | `blue` | 12 | `base0D` |
| 5 magenta | `purple` | 13 | `purple` mixed 25% toward fg |
| 6 cyan | `cyan` | 14 | `teal` |
| 7 white | `white` | 15 | `base07` |

- Background is `black` and foreground is `white`. When either is missing, the script uses `base00` / `base05`.
- Selection uses `one_bg3`, cursor uses `green`.
- Do not adjust colors for contrast, and do not set Ghostty's `minimum-contrast`. The user rejected both because they make the theme look wrong.

## Verify

1. `ghostty +show-config | grep -E '^(theme|background|foreground)'` must show the theme's background and foreground.
2. If they differ, look for another config file that overrides them. On macOS, `~/Library/Application Support/com.mitchellh.ghostty/config.ghostty` loads after `~/.config/dotfiles/ghostty/config`. Tell the user which lines win; do not edit that file without asking.
3. `zsh -n ~/.config/dotfiles/omz/themes/<theme>.zsh-theme` must exit 0.
4. Tell the user to reload: `cmd+shift+,` in Ghostty, `exec zsh` in the shell.

## Common mistakes

- Putting colors in `~/.config/dotfiles/ghostty/config` instead of a theme file. Colors set in the config override the theme.
- Changing the prompt layout. The generated zsh theme copies the layout of `~/.config/dotfiles/omz/themes/diegosaurus.zsh-theme`: a green or red arrow for the exit status, the directory in cyan, then `git:(branch)`. If the user changes that layout, update `zsh_theme()` in the script.
