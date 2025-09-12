<p align="center">
    <img src="https://github.com/rose-pine/rose-pine-theme/raw/main/assets/icon.png" width="80" />
    <h2 align="center">dotfiles</h2>
</p>

<p align="center">All natural pine, faux fur and a bit of soho vibes for the classy minimalist</p>

<p align="center">
  <img alt="Debian" src="https://img.shields.io/badge/Debian-13-26233a?style=for-the-badge&logo=debian&logoColor=eb6f92&labelColor=191724"/>
  
  <img alt="KDE Plasma" src="https://img.shields.io/badge/KDE-Plasma-26233a?style=for-the-badge&logo=kde&logoColor=9ccfd8&labelColor=191724"/>

  <img alt="Neovim" src="https://img.shields.io/badge/Neovim-26233a?style=for-the-badge&logo=neovim&logoColor=31748f&labelColor=191724"/>

  <a href="https://rosepinetheme.com/">
    <img src="https://img.shields.io/badge/theme-rosé%20pine-26233a?labelColor=191724&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjUwIiBoZWlnaHQ9IjIzNyIgdmlld0JveD0iMCAwIDI1MCAyMzciIGZpbGw9Im5vbm[...]"/>
  </a>
</p>

## Screenshots

Here are some screenshots of my setup:

- **Desktop**
  ![Desktop](public/desktop.png)

- **Neovim**
  ![Neovim](public/nvim.png)

- **Terminal**
  ![Terminal](public/terminal.png)

## Repository Structure

- **bat/**  
  Configuration files for `bat`, a terminal file viewer with syntax highlighting.

- **cava/**  
  Configs for `cava`, a terminal-based audio visualizer.

- **fish/**  
  Dotfiles, aliases, and functions for the `fish` shell.

- **fonts/**  
  Custom fonts for terminal and editors.

- **nvim/**  
  My Neovim setup, plugins, keymaps, and configurations.  
  **Note:** This setup depends on [LazyVim](https://www.lazyvim.org/) as the Neovim starter template.

- **public/**  
  Public assets like screenshots and shareable scripts.

- **superfile/**
  Configs for simple and efficient File Manager TUI superfile

- **starship.toml**  
  Configuration for [Starship](https://starship.rs/), a minimal and fast shell prompt.

- **waybar/**  
  Configuration files for [Waybar](https://github.com/Alexays/Waybar), a highly customizable status bar for Wayland compositors.

- **wlogout/**  
  Configuration for [wlogout](https://github.com/ArtsyMacaw/wlogout), a customizable logout menu for Wayland.

- **lazygit/**  
  Configuration for [Lazygit](https://github.com/jesseduffield/lazygit), a simple terminal UI for git commands.

## Requirements

- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/) **with [LazyVim](https://www.lazyvim.org/)**
- [Starship](https://starship.rs/)
- [Bat](https://github.com/sharkdp/bat)
- [Cava](https://github.com/karlstav/cava)
- [Superfile](https://superfile.netlify.app/)
- [Waybar](https://github.com/Alexays/Waybar)
- [wlogout](https://github.com/ArtsyMacaw/wlogout)
- [Lazygit](https://github.com/jesseduffield/lazygit)
- [Krohnkite](https://github.com/esjeon/krohnkite)
- Custom fonts (see the [`fonts`](./fonts) folder)

## How to Use

1. Clone this repository:
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git
   ```
2. Backup your current config files before replacing them.
3. Copy or symlink the desired files/folders to your `$HOME` directory.

## License

[GPLv3 License](./LICENSE)
