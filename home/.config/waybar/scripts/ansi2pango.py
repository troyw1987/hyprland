#!/usr/bin/env python3
"""Convert ANSI SGR color codes to Pango markup (for GTK/waybar tooltips)."""
import sys
import re

ANSI_RE = re.compile(r'\x1b\[([0-9;]*)m')

BASIC16 = [
    "#000000", "#cd0000", "#00cd00", "#cdcd00",
    "#0000ee", "#cd00cd", "#00cdcd", "#e5e5e5",
    "#7f7f7f", "#ff0000", "#00ff00", "#ffff00",
    "#5c5cff", "#ff00ff", "#00ffff", "#ffffff",
]


def color256(n):
    if n < 16:
        return BASIC16[n]
    if n < 232:
        n -= 16
        levels = [0, 95, 135, 175, 215, 255]
        r = levels[n // 36]
        g = levels[(n // 6) % 6]
        b = levels[n % 6]
        return f"#{r:02x}{g:02x}{b:02x}"
    gray = 8 + (n - 232) * 10
    return f"#{gray:02x}{gray:02x}{gray:02x}"


def escape(s):
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def render_chunk(chunk, fg, bg, bold, italic, underline):
    if not chunk:
        return ""
    esc = escape(chunk)
    attrs = []
    if fg:
        attrs.append(f"foreground='{fg}'")
    if bg:
        attrs.append(f"background='{bg}'")
    if bold:
        attrs.append("font_weight='bold'")
    if italic:
        attrs.append("font_style='italic'")
    if underline:
        attrs.append("underline='single'")
    if attrs:
        return f"<span {' '.join(attrs)}>{esc}</span>"
    return esc


def ansi_to_pango(text):
    out = []
    fg = bg = None
    bold = italic = underline = False
    pos = 0

    for m in ANSI_RE.finditer(text):
        chunk = text[pos:m.start()]
        out.append(render_chunk(chunk, fg, bg, bold, italic, underline))
        pos = m.end()

        codes = m.group(1).split(";") if m.group(1) else [""]
        i = 0
        while i < len(codes):
            c = codes[i]
            if c in ("", "0"):
                fg = bg = None
                bold = italic = underline = False
            elif c == "1":
                bold = True
            elif c == "22":
                bold = False
            elif c == "3":
                italic = True
            elif c == "23":
                italic = False
            elif c == "4":
                underline = True
            elif c == "24":
                underline = False
            elif c == "39":
                fg = None
            elif c == "49":
                bg = None
            else:
                try:
                    ci = int(c)
                except ValueError:
                    ci = None

                if ci is None:
                    pass
                elif 30 <= ci <= 37:
                    fg = BASIC16[ci - 30]
                elif 90 <= ci <= 97:
                    fg = BASIC16[ci - 90 + 8]
                elif 40 <= ci <= 47:
                    bg = BASIC16[ci - 40]
                elif 100 <= ci <= 107:
                    bg = BASIC16[ci - 100 + 8]
                elif ci == 38 and i + 1 < len(codes):
                    if codes[i + 1] == "5" and i + 2 < len(codes):
                        fg = color256(int(codes[i + 2]))
                        i += 2
                    elif codes[i + 1] == "2" and i + 4 < len(codes):
                        r, g, b = (int(codes[i + 2]), int(codes[i + 3]),
                                   int(codes[i + 4]))
                        fg = f"#{r:02x}{g:02x}{b:02x}"
                        i += 4
                elif ci == 48 and i + 1 < len(codes):
                    if codes[i + 1] == "5" and i + 2 < len(codes):
                        bg = color256(int(codes[i + 2]))
                        i += 2
                    elif codes[i + 1] == "2" and i + 4 < len(codes):
                        r, g, b = (int(codes[i + 2]), int(codes[i + 3]),
                                   int(codes[i + 4]))
                        bg = f"#{r:02x}{g:02x}{b:02x}"
                        i += 4
            i += 1

    out.append(render_chunk(text[pos:], fg, bg, bold, italic, underline))
    return "".join(out)


if __name__ == "__main__":
    sys.stdout.write(ansi_to_pango(sys.stdin.read()))
