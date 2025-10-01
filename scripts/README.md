# scripts

This directory contains personal scripts and utilities to improve productivity, automation, and fun in your Linux environment. Each script serves a specific purpose and can be adapted to your workflow.

## Contents

- **.music.json**  
  Playlist configuration for `lofi.py` (see below).

- **colors.sh**  
  Shows ANSI color codes in your terminal for quick reference.  
  _Usage:_ `bash colors.sh`

- **commits.sh**  
  Suggests a Conventional Commit message based on the staged changes in your git repository.  
  _Usage:_  
  1. Stage your changes with `git add ...`
  2. Run: `bash commits.sh`

- **lofi.py**  
  A TUI (terminal user interface) music player for Lo-fi tracks from YouTube, using [mpv](https://mpv.io/).  
  _Usage:_ `python3 lofi.py`  
  _Controls:_ `j`/`k` to navigate, `Enter` to play, `p` to pause/resume, `q` to quit.

- **qrcode.sh**  
  Generates and displays a QR code in your terminal from any text or URL (requires `qrencode`).  
  _Usage:_ `bash qrcode.sh "your text or URL"`

- **logo.sh**
  An amazing debian logo!
  _Usage:_ `bash logo.sh`

- **repos.sh**  
  Interactively clone multiple public GitHub repositories from any user (needs `gh`, `gum`, and `jq`).  
  _Usage:_ `bash repos.sh`

- **README.md**  
  This file! An overview and usage guide for all scripts in this directory.

---

## Tips

- Feel free to modify, expand, or replace any script to suit your needs.
- Check script headers for prerequisites (some require extra packages).
- For questions or suggestions, open an Issue or Pull Request in the main repository.

