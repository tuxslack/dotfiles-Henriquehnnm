#!/bin/bash

# =================================================================================================
#
#          INSTALADOR DE DOTFILES - https://github.com/autobrolys/dotfiles
#
#   Este script irá instalar as configurações, fontes e scripts contidos neste repositório.
#
#   AVISO: Execute este script por sua conta e risco. Revise o código antes de executar.
#
# =================================================================================================

# ------------------------------------------------------
# Variáveis e Cores
# ------------------------------------------------------
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"
LOCAL_BIN_DIR="$HOME/.local/bin"
FONTS_DIR="$HOME/.local/share/fonts"
KONSOLE_PROFILE_DIR="$HOME/.local/share/konsole"
KONSOLE_COLOR_DIR="$HOME/.local/share/color-schemes"

# Cores para o output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
echo -e "${GREEN}Iniciando a instalação dos dotfiles...${NC}"
echo -e "${BLUE}
 ██████████             █████       ██████   ███  ████                  
░░███░░░░███           ░░███       ███░░███ ░░░  ░░███                  
 ░███   ░░███  ██████  ███████    ░███ ░░░  ████  ░███   ██████   █████ 
 ░███    ░███ ███░░███░░░███░    ███████   ░░███  ░███  ███░░███ ███░░  
 ░███    ░███░███ ░███  ░███    ░░░███░     ░███  ░███ ░███████ ░░█████ 
 ░███    ███ ░███ ░███  ░███ ███  ░███      ░███  ░███ ░███░░░   ░░░░███
 ██████████  ░░██████   ░░█████   █████     █████ █████░░██████  ██████ 
░░░░░░░░░░    ░░░░░░     ░░░░░   ░░░░░     ░░░░░ ░░░░░  ░░░░░░  ░░░░░░  
${NC}
"

# ------------------------------------------------------
# Instalação de Pacotes
# ------------------------------------------------------
install_packages() {
  echo -e "${YELLOW}[*] Instalando pacotes necessários...${NC}"

  # ---!!! IMPORTANTE !!!---
  # O script assume que você está usando Debian/Ubuntu (com apt).
  # Se você usa outra distribuição, comente/descomente e ajuste a linha correspondente.

  # --- Debian/Ubuntu (apt) ---
  sudo apt update && sudo apt install -y \
    bat cava fish lazygit lsd neovim qutebrowser starship gum waybar wlogout \
    nmap qrencode jq curl unzip mpv python3 fonts-firacode

  # --- Arch Linux (pacman) ---
  # sudo pacman -S --noconfirm --needed \
  #     bat cava fish lazygit lsd neovim qutebrowser starship waybar wlogout \
  #     nmap qrencode jq curl unzip mpv python ttf-nerd-fonts-symbols

  # --- Fedora (dnf) ---
  # sudo dnf install -y \
  #     bat cava fish lazygit lsd neovim qutebrowser starship \
  #     nmap qrencode jq curl unzip mpv python3 fira-code-fonts

  echo -e "${GREEN}[+] Pacotes instalados com sucesso.${NC}"
  echo ""
}

# ------------------------------------------------------
# Instalação das Fontes
# ------------------------------------------------------
install_fonts() {
  echo -e "${YELLOW}[*] Instalando fontes (BlexMono Nerd Font)...${NC}"
  mkdir -p "$FONTS_DIR"
  cp -r "$DOTFILES_DIR/fonts/"* "$FONTS_DIR/"
  fc-cache -fv >/dev/null 2>&1
  echo -e "${GREEN}[+] Fontes instaladas e cache atualizado.${NC}"
  echo ""
}

# ------------------------------------------------------
# Cópia de Configurações
# ------------------------------------------------------
copy_configs() {
  echo -e "${YELLOW}[*] Copiando configurações...${NC}"
  mkdir -p "$CONFIG_DIR"

  # Lista de diretórios de configuração para copiar
  configs_to_copy=(
    bat cava fish lazygit lsd nvim qutebrowser superfile waybar wlogout
  )

  for config in "${configs_to_copy[@]}"; do
    # Remove configuração existente se houver
    [ -d "$CONFIG_DIR/$config" ] && rm -rf "$CONFIG_DIR/$config"
    cp -r "$DOTFILES_DIR/$config" "$CONFIG_DIR/$config"
    echo -e "    -> Copiado ${BLUE}$config${NC}"
  done

  # Arquivos de configuração individuais
  cp -f "$DOTFILES_DIR/starship.toml" "$CONFIG_DIR/starship.toml"
  echo -e "    -> Copiado ${BLUE}starship.toml${NC}"

  # Configurações do Konsole
  mkdir -p "$KONSOLE_PROFILE_DIR"
  cp -f "$DOTFILES_DIR/konsole/Broly.profile" "$KONSOLE_PROFILE_DIR/Broly.profile"
  cp -f "$DOTFILES_DIR/konsole/catppuccin-mocha.colorscheme" "$KONSOLE_PROFILE_DIR/catppuccin-mocha.colorscheme"
  echo -e "    -> Copiado ${BLUE}Konsole (perfil e tema)${NC}"

  echo -e "${GREEN}[+] Configurações copiadas com sucesso.${NC}"
  echo ""
}

# ------------------------------------------------------
# Instalação dos Scripts
# ------------------------------------------------------
install_scripts() {
  echo -e "${YELLOW}[*] Instalando scripts...${NC}"

  # Casos especiais: lofi.py e .music.json na home
  cp -f "$DOTFILES_DIR/scripts/lofi.py" "$HOME/.lofi.py"
  echo -e "    -> Copiado ${BLUE}lofi.py${NC} para ${HOME}/.lofi.py"
  cp -f "$DOTFILES_DIR/scripts/.music.json" "$HOME/.music.json"
  echo -e "    -> Copiado ${BLUE}.music.json${NC} para ${HOME}/.music.json"

  # Download de scripts externos
  echo -e "${YELLOW}[*] Baixando scripts externos para a home...${NC}"
  curl -sL "https://github.com/Henriquehnnm/HydroFetch/raw/refs/heads/main/Fetch-scripts/hydrofetch.sh" -o "$HOME/.hydrofetch.sh"
  echo -e "    -> Baixado ${BLUE}hydrofetch.sh${NC} para ${HOME}/.hydrofetch.sh"
  curl -sL "https://github.com/Henriquehnnm/HydroTop/raw/refs/heads/main/hydrotop.py" -o "$HOME/.hydrotop.py"
  echo -e "    -> Baixado ${BLUE}hydrotop.py${NC} para ${HOME}/.hydrotop.py"
  curl -sL "https://github.com/Henriquehnnm/HydroToDo/raw/refs/heads/main/hydrotodo.py" -o "$HOME/.hydrotodo.py"
  echo -e "    -> Baixado ${BLUE}hydrotodo.py${NC} para ${HOME}/.hydrotodo.py"

  # Instalação dos outros scripts em .local/bin
  echo -e "${YELLOW}[*] Instalando scripts restantes em $LOCAL_BIN_DIR...${NC}"
  mkdir -p "$LOCAL_BIN_DIR"

  for script in "$DOTFILES_DIR/scripts/"*; do
    local script_name=$(basename "$script")

    # Pula os arquivos já tratados
    if [[ "$script_name" == "lofi.py" || "$script_name" == ".music.json" ]]; then
      continue
    fi

    if [ -f "$script" ]; then
      local dest_path="$LOCAL_BIN_DIR/$script_name"
      ln -sf "$script" "$dest_path"
      chmod +x "$dest_path"
      echo -e "    -> Script ${BLUE}$script_name${NC} instalado."
    fi
  done

  echo -e "${GREEN}[+] Scripts instalados com sucesso.${NC}"
  echo ""
}

# ------------------------------------------------------
# Função Principal
# ------------------------------------------------------
main() {
  install_packages
  install_fonts
  copy_configs
  install_scripts

  echo -e "${GREEN}=======================================================${NC}"
  echo -e "${GREEN}      Dotfiles instalados com sucesso! 🎉${NC}"
  echo -e "${GREEN}=======================================================${NC}"
  echo ""
  echo -e "   Por favor, reinicie seu terminal ou mude para o shell 'fish'"
  echo -e "   para que todas as alterações tenham efeito."
  echo ""
}

# Executa a função principal
main
