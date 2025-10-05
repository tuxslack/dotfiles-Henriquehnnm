#!/usr/bin/env bash
#
# ========================================================================================
#
# Autor:           Henrique Sardinha - https://github.com/Henriquehnnm
# Colaboração:     Fernando Souza    - https://github.com/tuxslack / https://www.youtube.com/@fernandosuporte
# Data:            05/10/2025
# Atualização em:  https://github.com/tuxslack/dotfiles-Henriquehnnm
# Script:          weather.sh
# Versão:          0.2
# Licença:         MIT
#
# Descrição: 
#
# Previsão do tempo direto no terminal usando wttr.in.
# 
# 
# 
#
#
# Instalação:
#
# sudo mv -i ~/Downloads/weather.sh  /usr/local/bin/
#
# sudo chmod +x /usr/local/bin/weather.sh
#
#
# Uso: 
#
# weather.sh Sao_Paulo
# weather.sh rio
#
#
# ========================================================================================

# https://github.com/Henriquehnnm/dotfiles

clear

# É grátis, mas tem limite de requisições por IP por minuto.

# Tem uma versão para navegadores com visual em ASCII também:

# 👉 https://wttr.in


# O wttr.in depende de dados de geolocalização de fontes como o OpenWeatherMap, e se a 
# cidade não for reconhecida corretamente (por exemplo, por estar mal escrita ou não estar 
# na base de dados), ele não retorna os dados esperados — pode retornar uma página em branco 
# ou um erro genérico.

CITY="${1:-Abadiânia}"

# ----------------------------------------------------------------------------------------

if ! command -v curl >/dev/null; then

  echo -e "\ncurl não instalado.\n"

  exit 1

fi

# ----------------------------------------------------------------------------------------

# weather.sh rio_janeiro

RESULT=$(curl -s "wttr.in/$CITY?format=3")

if [[ "$RESULT" == *"Unknown location"* ]]; then

  echo -e "\n❌ Cidade '$CITY' não encontrada.\n"

  exit 1

fi

# ----------------------------------------------------------------------------------------


echo "Buscando previsão para $CITY..."
echo
curl -s "wttr.in/$CITY?format=3"
echo

# Previsão em português
echo -e "Detalhes completos: \n"
curl -s "wttr.in/$CITY?0&lang=pt-br"

echo
echo -e "💡 Dica: Adicione ao seu ~/.bashrc, ~/.zshrc, ~/.config/fish/config.fish: \n"
echo "   alias clima='curl -s wttr.in/$CITY?lang=pt-br'"

# ----------------------------------------------------------------------------------------

exit 0

