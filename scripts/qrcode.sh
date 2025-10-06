#!/usr/bin/env bash
#
# ========================================================================================
#
# Autor:           Henrique Sardinha - https://github.com/Henriquehnnm
# Colaboração:     Fernando Souza    - https://github.com/tuxslack / https://www.youtube.com/@fernandosuporte
# Data:            05/10/2025
# Atualização em:  https://github.com/tuxslack/dotfiles-Henriquehnnm
# Script:          qrcode.sh
# Versão:          0.2
# Licença:         GPLv3
#
# Descrição: 
#
# Gera um QR Code no terminal usando o utilitário qrencode, a partir de texto ou URL 
# informado pelo usuário.
# 
# Certifique-se de que o modo de economia de bateria está desativado (no Android).
# 
#
#
# Instalação:
#
# sudo mv -i ~/Downloads/qrcode.sh  /usr/local/bin/
#
# sudo chmod +x /usr/local/bin/qrcode.sh
#
#
# Uso: 
#
# qrcode.sh "Gera um QR Code no terminal usando o utilitário qrencode, a partir de texto 
# ou URL informado pelo usuário.
#
# https://github.com/tuxslack/dotfiles-Henriquehnnm"
# 
#
#
# ========================================================================================

# Gerador de QR Code no terminal usando qrencode
# Requer: qrencode (sudo apt install qrencode)

clear

# ----------------------------------------------------------------------------------------

if ! command -v qrencode >/dev/null; then

  echo -e "\nErro: qrencode não está instalado.\n"

  exit 1

fi

# ----------------------------------------------------------------------------------------

if [ $# -eq 0 ]; then

  echo -e "\nUso: $0 'texto ou URL para gerar QR Code'\n"

  exit 1

fi

# ----------------------------------------------------------------------------------------

echo -e "\nGerando QR Code para: $1 \n"

sleep 1

clear

echo -e "\n"

qrencode -t ANSIUTF8 "$1"


echo -e "\nEscaneie o QR Code acima com seu celular. \n\nCertifique-se de que o modo de economia de bateria está desativado (no Android).\n"

# ----------------------------------------------------------------------------------------

exit 0

