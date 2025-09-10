# dotfiles

Personal dotfiles repository to easily set up and replicate my development environment.

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
  Extra scripts and utilities for further automation and customization.

## Requirements

- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/) **with [LazyVim](https://www.lazyvim.org/)**
- [Starship](https://starship.rs/)
- [Bat](https://github.com/sharkdp/bat)
- [Cava](https://karlstav.github.io/cava/)
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
