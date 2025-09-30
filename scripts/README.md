# Scripts

This directory contains personal utilities and helper tools used in my Linux setup. They make tasks like viewing ANSI colors in the terminal, cloning repositories, and playing Lo-fi music via TUI easier. Below you’ll find a description of each script:

## scripts/colors.sh

Displays examples of basic, bright, and background ANSI colors directly in the terminal.  
**Usage:**  
```sh
bash colors.sh
```

## scripts/repos.sh

Clone multiple public GitHub repositories from a user using GitHub CLI and the interactive Gum tool.  
- Requires: [gh](https://cli.github.com/), [gum](https://github.com/charmbracelet/gum), [jq](https://stedolan.github.io/jq/)  
**Usage:**  
```sh
bash repos.sh
```

## scripts/lofi.py

Interactive text-based interface to play Lo-fi music from YouTube (audio only), using [mpv](https://mpv.io/) and a `.music.json` file to manage the playlist.  
- Requires: Python 3, [mpv](https://mpv.io/), curses (included), socket, uuid  
**Usage:**  
```sh
python3 lofi.py
```
- Navigation: `j` (down), `k` (up), `Enter` (play), `p` (pause/resume), `q` (quit).

## scripts/.music.json

Configuration file for `lofi.py`, containing a list of Lo-fi music tracks from YouTube.  
Example entry:
```json
[
  {
    "title": "Diolinux Lo-fi",
    "url": "https://www.youtube.com/watch?v=NT3Zcjl4-ts"
  }
]
```

---

**Tip:**  
Feel free to modify, adapt, or add new scripts as needed.  
For questions or suggestions, open an Issue or Pull Request.

