#!/usr/bin/env bash
#
# ========================================================================================
#
# Autor:           Henrique Sardinha - https://github.com/Henriquehnnm
# Colaboração:     Fernando Souza    - https://github.com/tuxslack / https://www.youtube.com/@fernandosuporte
# Data:            05/10/2025
# Atualização em:  https://github.com/tuxslack/dotfiles-Henriquehnnm
# Script:          ascii-art.sh
# Versão:          0.2
# Licença:         MIT
#
# Descrição: 
# 
# Converte imagens em arte ASCII no terminal usando o utilitário jp2a. Mostra instrução de 
# uso, verifica pré-requisitos e permite salvar o resultado em arquivo.
# 
#
# Instalação:
#
# sudo mv -i ~/Downloads/ascii-art.sh  /usr/local/bin/
#
# sudo chmod +x /usr/local/bin/ascii-art.sh
#
#
# Uso: 
#
# 
# ascii-art.sh <imagem.jpg>
#
#
# ========================================================================================


clear

# ----------------------------------------------------------------------------------------

if ! command -v jp2a >/dev/null; then

  echo -e "\njp2a não instalado.\n"

  exit 1

fi

# ----------------------------------------------------------------------------------------

if [ $# -eq 0 ]; then

  echo -e "\nUso: bash ascii-art.sh <imagem.jpg>\n"

  exit 1

fi

# ----------------------------------------------------------------------------------------

IMAGE="$1"

if [ ! -f "$IMAGE" ]; then

  echo -e "\nArquivo não encontrado: $IMAGE\n"

  exit 1

fi

# ----------------------------------------------------------------------------------------

echo -e "\n🎨 Convertendo para ASCII art...\n"


jp2a --width=80 "$IMAGE"


echo -e "\n💡 Salvar em arquivo: bash ascii-art.sh imagem.jpg > output.txt"

# ----------------------------------------------------------------------------------------

exit 0

