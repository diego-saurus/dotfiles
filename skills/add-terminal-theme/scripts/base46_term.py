import argparse
import re
import sys
import urllib.request
from pathlib import Path

BASE46_URL = "https://raw.githubusercontent.com/NvChad/base46/refs/heads/v3.0/lua/base46/themes/{}.lua"
ANSI_SLOTS = [
    ("one_bg", None), ("red", None), ("green", None), ("yellow", None),
    ("blue", None), ("purple", None), ("cyan", None), ("white", None),
    ("light_grey", None), ("baby_pink", "red"), ("vibrant_green", "green"), ("sun", "yellow"),
    ("base0D", "blue"), (None, "purple"), ("teal", "cyan"), ("base07", "white"),
]


def parse_block(lua, block):
    match = re.search(rf"{block}\s*=\s*\{{(.*?)\}}", lua, re.S)
    if not match:
        return {}
    pairs = re.findall(r'(\w+)\s*=\s*"(#[0-9a-fA-F]{6})"', match.group(1))
    return {key: value.lower() for key, value in pairs}


def mix(a, b, weight):
    ca = [int(a[i:i + 2], 16) for i in (1, 3, 5)]
    cb = [int(b[i:i + 2], 16) for i in (1, 3, 5)]
    return "#" + "".join(f"{round(x + (y - x) * weight):02x}" for x, y in zip(ca, cb))


def build_palette(base30, base16):
    background = base30.get("black") or base16["base00"]
    foreground = base30.get("white") or base16["base05"]
    colors = {**base16, **base30}
    palette = []
    for key, fallback in ANSI_SLOTS:
        if key in colors:
            color = colors[key]
        elif fallback in colors:
            color = mix(colors[fallback], foreground, 0.25)
        else:
            color = foreground
        palette.append(color)
    selection = colors.get("one_bg3") or base16["base02"]
    return background, foreground, palette, selection


def ghostty_theme(background, foreground, palette, selection):
    lines = [
        f"background = {background}",
        f"foreground = {foreground}",
        f"cursor-color = {palette[2]}",
        f"cursor-text = {background}",
        f"selection-background = {selection}",
        f"selection-foreground = {foreground}",
    ]
    lines += [f"palette = {i}={c}" for i, c in enumerate(palette)]
    return "\n".join(lines) + "\n"


def zsh_theme(palette):
    red, green, yellow, blue, cyan = palette[1], palette[2], palette[3], palette[4], palette[6]
    return (
        f'PROMPT="%(?:%B%F{{{green}}}%1{{➜%}}%b :%B%F{{{red}}}%1{{➜%}}%b ) %F{{{cyan}}}%c%f"\n'
        "PROMPT+=' $(git_prompt_info)'\n\n"
        f'ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{{{blue}}}git:(%b%F{{{red}}}"\n'
        'ZSH_THEME_GIT_PROMPT_SUFFIX="%f "\n'
        f'ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{{{blue}}})%b %F{{{yellow}}}%1{{✗%}}"\n'
        f'ZSH_THEME_GIT_PROMPT_CLEAN="%B%F{{{blue}}})%b"\n'
    )


def set_line(path, pattern, line):
    text = path.read_text() if path.exists() else ""
    if re.search(pattern, text, re.M):
        text = re.sub(pattern, line, text, count=1, flags=re.M)
    else:
        text = text + ("" if text.endswith("\n") or not text else "\n") + line + "\n"
    path.write_text(text)


def remove_line(path, pattern):
    if path.exists():
        path.write_text(re.sub(pattern, "", path.read_text(), flags=re.M))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("theme")
    parser.add_argument("--ghostty-dir", type=Path, default=Path.home() / ".config/ghostty")
    parser.add_argument("--zsh-dir", type=Path, default=Path.home() / ".oh-my-zsh/custom/themes")
    parser.add_argument("--zshrc", type=Path, default=Path.home() / ".zshrc")
    parser.add_argument("--no-activate", action="store_true")
    args = parser.parse_args()

    if not re.fullmatch(r"[\w-]+", args.theme):
        sys.exit(f"invalid theme name: {args.theme}")
    try:
        lua = urllib.request.urlopen(BASE46_URL.format(args.theme), timeout=15).read().decode()
    except Exception as error:
        sys.exit(f"cannot fetch base46 theme '{args.theme}': {error}")

    base30, base16 = parse_block(lua, "base_30"), parse_block(lua, "base_16")
    if not base16 or not base30:
        sys.exit("theme file has no base_30/base_16 hex colors")
    background, foreground, palette, selection = build_palette(base30, base16)

    theme_file = args.ghostty_dir / "themes" / args.theme
    theme_file.parent.mkdir(parents=True, exist_ok=True)
    theme_file.write_text(ghostty_theme(background, foreground, palette, selection))
    zsh_file = args.zsh_dir / f"{args.theme}.zsh-theme"
    zsh_file.parent.mkdir(parents=True, exist_ok=True)
    zsh_file.write_text(zsh_theme(palette))

    if not args.no_activate:
        set_line(args.ghostty_dir / "config", r"^theme\s*=.*$", f"theme = {args.theme}")
        remove_line(args.ghostty_dir / "config", r"^minimum-contrast\s*=.*\n?")
        set_line(args.zshrc, r'^ZSH_THEME=.*$', f'ZSH_THEME="{args.theme}"')

    print(f"wrote {theme_file}\nwrote {zsh_file}")
    for index, color in enumerate(palette):
        print(f"palette {index:2} {color}")


if __name__ == "__main__":
    main()
