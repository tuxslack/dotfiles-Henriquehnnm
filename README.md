<p align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/>
    <h2 align="center">dotfiles</h2>
</p>

<p align="center">
  <img alt="Debian" src="https://img.shields.io/badge/Debian-13-313244?style=for-the-badge&logo=debian&logoColor=f38ba8&labelColor=1e1e2e"/>
  
  <img alt="KDE Plasma" src="https://img.shields.io/badge/KDE-Plasma-313244?style=for-the-badge&logo=kde&logoColor=89b4fa&labelColor=1e1e2e"/>

  <img alt="Neovim" src="https://img.shields.io/badge/Neovim-313244?style=for-the-badge&logo=neovim&logoColor=a6e3a1&labelColor=1e1e2e"/>

  <a href="https://catppuccin.com/">
    <img src="https://img.shields.io/badge/theme-catppuccin-313244?style=for-the-badge&logo=catppuccin&logoColor=f5e0dc&labelColor=1e1e2e"/>
  </a>
</p>

## Screenshots

Here are some screenshots of my setup:

- **Desktop**
  ![Desktop](public/desktop.png?1)

- **Neovim**
  ![Neovim](public/nvim.png?1)

- **Qutebrowser**
  ![qute](public/qute.png?1)

- **Terminal**
  ![Terminal](public/terminal.png?1)

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
  Public assets such as screenshots.

- **scripts/**
  My useful scripts, which I won't let go of.

- **superfile/**
  Configs for simple and efficient File Manager TUI superfile

- **starship.toml**  
  Configuration for [Starship](https://starship.rs/), a minimal and fast shell prompt.
 
- **qutebrowser/**
  Configuration for [qutebrowser](https://qutebrowser.org)

- **wallpapers/**
  My Wallpaper Collection

- **waybar/**  
  Configuration files for [Waybar](https://github.com/Alexays/Waybar), a highly customizable status bar for Wayland compositors.

- **wlogout/**  
  Configuration for [wlogout](https://github.com/ArtsyMacaw/wlogout), a customizable logout menu for Wayland.

- **lazygit/**  
  Configuration for [Lazygit](https://github.com/jesseduffield/lazygit), a simple terminal UI for git commands.

- **konsole/**
  Configuration for the [Konsole](https://konsole.kde.org/) terminal emulator.

## Requirements

- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/) **with [LazyVim](https://www.lazyvim.org/)**
- [Starship](https://starship.rs/)
- [Bat](https://github.com/sharkdp/bat)
- [Cava](https://github.com/karlstav/cava)
- [Superfile](https://superfile.netlify.app/)
- [Waybar](https://github.com/Alexays/Waybar)
- [Qutebrowser](https://qutebrowser.org)
- [wlogout](https://github.com/ArtsyMacaw/wlogout)
- [Lazygit](https://github.com/jesseduffield/lazygit)
- [Konsole](https://konsole.kde.org/)
- [Krohnkite](https://github.com/esjeon/krohnkite)
- Custom fonts (see the [`fonts`](./fonts) folder)
- [Catppuccin](https://catppuccin.com/) theme (applied wherever possible)

## How to Use

1. Clone this repository:
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git
   ```
2. Backup your current config files before replacing them.
3. Copy or symlink the desired files/folders to your `$HOME` directory.

## License

[GPLv3 License](./LICENSE)
