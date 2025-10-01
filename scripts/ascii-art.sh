#!/bin/bash
# Converte imagens para ASCII art
# Requer: jp2a (sudo apt install jp2a)

if ! command -v jp2a >/dev/null; then
  echo "jp2a não instalado. Rode: sudo apt install jp2a"
  exit 1
fi

if [ $# -eq 0 ]; then
  echo "Uso: bash ascii-art.sh <imagem.jpg>"
  exit 1
fi

IMAGE="$1"

if [ ! -f "$IMAGE" ]; then
  echo "Arquivo não encontrado: $IMAGE"
  exit 1
fi

echo "🎨 Convertendo para ASCII art..."
echo

jp2a --width=80 "$IMAGE"

echo
echo "💡 Salvar em arquivo: bash ascii-art.sh imagem.jpg > output.txt"
