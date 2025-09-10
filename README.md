# dotfiles

Personal dotfiles repository to easily set up and replicate my development environment.


![Debian 13](https://img.shields.io/badge/Debian-13-red?style=flat-square&logo=debian)
![KDE Plasma](https://img.shields.io/badge/KDE-Plasma-blue?style=flat-square&logo=kde)
![Neovim](https://img.shields.io/badge/Neovim-0.9-green?style=flat-square&logo=neovim)
![Rose Pine](https://img.shields.io/badge/Theme-Rose%20Pine-pink?style=flat-square)

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

- **starship.toml**  
  Configuration for [Starship](https://starship.rs/), a minimal and fast shell prompt.

- **superfile/**
  Configs for simple and efficient File Manager TUI superfile

## Requirements

- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/) **with [LazyVim](https://www.lazyvim.org/)**
- [Starship](https://starship.rs/)
- [Bat](https://github.com/sharkdp/bat)
- [Cava](https://karlstav.github.io/cava/)
- [Superfile](https://superfile.netlify.app/)
- Custom fonts (see the `fonts` folder)

## How to Use

1. Clone this repository:
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git
   ```
2. Backup your current config files before replacing them.
3. Copy or symlink the desired files/folders to your `$HOME` directory.

## License

[GPLv3 License](./LICENSE)
