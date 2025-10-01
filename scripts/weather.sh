#!/bin/bash
# Previsão do tempo direto no terminal usando wttr.in

CITY="${1:-Abadiana}"
echo "Buscando previsão para $CITY..."
echo
curl -s "wttr.in/$CITY?format=3"
echo
echo "Detalhes completos:"
curl -s "wttr.in/$CITY?0&lang=pt-br"
echo
echo "💡 Dica: Adicione ao seu .bashrc/.zshrc/.config/fish/config.fish:"
echo "   alias clima='curl -s wttr.in/Abadiana?lang=pt-br'"
