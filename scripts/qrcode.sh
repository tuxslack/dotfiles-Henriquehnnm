#!/bin/bash
# Gerador de QR Code no terminal usando qrencode
# Requer: qrencode (sudo apt install qrencode)

if ! command -v qrencode >/dev/null; then
  echo "Erro: qrencode não está instalado."
  echo "Instale com: sudo apt install qrencode"
  exit 1
fi

if [ $# -eq 0 ]; then
  echo "Uso: $0 'texto ou URL para gerar QR Code'"
  exit 1
fi

echo "Gerando QR Code para: $1"
echo

qrencode -t ANSIUTF8 "$1"

echo
echo "Escaneie o QR Code acima com seu celular!"
