<p align="center">
  <img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo Catppuccin"/>
  <h2 align="center">Dotfiles</h2>
  <p align="center"><em>Configuración de Linux minimalista, hermosa y altamente personalizada</em></p>
</p>

<p align="center">
  <img alt="Debian" src="https://img.shields.io/badge/Debian-13-313244?style=for-the-badge&logo=debian&logoColor=f38ba8&labelColor=1e1e2e"/>
  <img alt="KDE Plasma" src="https://img.shields.io/badge/KDE-Plasma-313244?style=for-the-badge&logo=kde&logoColor=89b4fa&labelColor=1e1e2e"/>
  <img alt="Neovim" src="https://img.shields.io/badge/Neovim-313244?style=for-the-badge&logo=neovim&logoColor=a6e3a1&labelColor=1e1e2e"/>
  <a href="https://catppuccin.com/">
    <img src="https://img.shields.io/badge/theme-catppuccin-313244?style=for-the-badge&logo=catppuccin&logoColor=f5e0dc&labelColor=1e1e2e"/>
  </a>
</p>

---

## ✨ Acerca de

Este repositorio reúne mi colección personal de archivos de configuración ("dotfiles") para Linux, optimizados para **Debian 13** usando la interfaz **KDE Plasma**, el editor **Neovim** con [LazyVim](https://www.lazyvim.org/) y varios otros programas.

---

## 🖼️ Capturas de Pantalla

| Escritorio | Neovim | Qutebrowser | Terminal |
|:---:|:---:|:---:|:---:|
| ![Desktop](public/desktop.png?1) | ![Neovim](public/nvim.png?1) | ![qute](public/qute.png?1) | ![Terminal](public/terminal.png?1) |

---

## 🗂️ Estructura del Repositorio

```
.
├── bat/           # Configuración del visor de archivos 'bat'
├── cava/          # Configuración del visualizador de audio 'cava'
├── fish/          # Funciones, alias y configuración de Fish Shell
├── fonts/         # Fuentes personalizadas
├── konsole/       # Configuración del terminal Konsole
├── lazygit/       # Configuración de Lazygit (UI para git)
├── nvim/          # Configuración completa de Neovim con LazyVim
├── public/        # Imágenes públicas y otros recursos
├── qutebrowser/   # Configuración de Qutebrowser
├── scripts/       # Scripts personales útiles
├── starship.toml  # Configuración del prompt Starship
├── superfile/     # Configuración de Superfile (gestor de archivos TUI)
├── wallpapers/    # Colección de fondos de pantalla
├── waybar/        # Configuración de la barra de estado Waybar
├── wlogout/       # Configuración del menú de cierre de sesión wlogout
└── LICENSE
```

---

## 📦 Requerimientos

- [Debian Linux](https://www.debian.org/) (recomendado)
- [KDE Plasma](https://kde.org/plasma-desktop/)
- [Fish Shell](https://fishshell.com/)
- [Neovim](https://neovim.io/) **con [LazyVim](https://www.lazyvim.org/)**
- [Starship](https://starship.rs/)
- [Bat](https://github.com/sharkdp/bat)
- [Cava](https://github.com/karlstav/cava)
- [Superfile](https://superfile.netlify.app/)
- [Waybar](https://github.com/Alexays/Waybar)
- [Qutebrowser](https://qutebrowser.org)
- [wlogout](https://github.com/ArtsyMacaw/wlogout)
- [Lazygit](https://github.com/jesseduffield/lazygit)
- [Konsole](https://konsole.kde.org/)
- [Krohnkite](https://github.com/esjeon/krohnkite) (tiling para KDE)
- [Tema Catppuccin](https://catppuccin.com/) (aplicado en todas las aplicaciones compatibles)
- Fuentes personalizadas (ver la carpeta [`fonts`](./fonts))

---

## 🚀 Instalación y Uso

1. **Clona el repositorio:**
   ```sh
   git clone https://github.com/Henriquehnnm/dotfiles.git
   ```
2. **Haz una copia de seguridad de tus archivos de configuración actuales** antes de reemplazarlos.
3. **Copia o crea enlaces simbólicos** de los archivos/carpetas deseados a tu directorio `$HOME`.

   Ejemplos:
   ```sh
   cp -r nvim ~/.config/
   ln -s ~/dotfiles/fish ~/.config/fish
   ```

4. **Instala los requisitos** de acuerdo a tu distribución y aplica las configuraciones según sea necesario.

---

## 💡 Consejos

- Adapta los archivos a tus preferencias personales.
- Recomiendo revisar las configuraciones antes de sobrescribir las tuyas.

---

## 📝 Licencia

Distribuido bajo la [Licencia GPLv3](./LICENSE).

---

<p align="center">
  <sub>Hecho con ❤️ por <a href="https://github.com/Henriquehnnm">Henriquehnnm</a></sub>
</p>
