#!/bin/bash

# Script para gerenciar a lista de músicas lofi em ~/.music.json
# Dependências: jq, gum (https://github.com/charmbracelet/gum)

# --- Variáveis ---
MUSIC_FILE="$HOME/.music.json"

# --- Funções ---

# Verifica se as dependências estão instaladas
check_deps() {
  local missing_deps=()
  for dep in jq gum; do
    if ! command -v "$dep" &>/dev/null; then
      missing_deps+=("$dep")
    fi
  done

  if [ ${#missing_deps[@]} -ne 0 ]; then
    echo "Erro: Dependências não encontradas: ${missing_deps[*]}"
    echo "Por favor, instale-as para continuar."
    exit 1
  fi
}

# Garante que o arquivo JSON exista
initialize_json() {
  if [ ! -f "$MUSIC_FILE" ]; then
    echo "Arquivo de música não encontrado. Criando um novo em $MUSIC_FILE"
    echo "[]" >"$MUSIC_FILE"
  fi
}

# Adiciona uma nova música à lista
add_lofi() {
  local temp_file
  temp_file=$(mktemp)

  # Usa gum input para pegar o título e URL
  title=$(gum input --placeholder "Nome da música")
  url=$(gum input --placeholder "URL do YouTube")

  # Se algum campo estiver vazio, cancela
  if [ -z "$title" ] || [ -z "$url" ]; then
    echo "Operação cancelada."
    return
  fi

  # Usa `jq` para adicionar o novo objeto ao array JSON de forma segura
  jq \
    --arg title "$title" \
    --arg url "$url" \
    '. + [{"title": $title, "url": $url}]' \
    "$MUSIC_FILE" >"$temp_file" && mv "$temp_file" "$MUSIC_FILE"

  echo "✅ Lofi '$title' adicionado com sucesso!"
  sleep 1
}

# Lista as músicas salvas
list_lofis() {
  echo "--- Sua Lista de Lofis ---"
  jq -r '.[] | "🎵 \(.title)\n   └─ \(.url)"' "$MUSIC_FILE"
  echo "--------------------------"
  echo "Pressione Enter para voltar ao menu..."
  read -r
}

# --- Lógica Principal ---
main() {
  check_deps
  initialize_json

  while true; do
    # Usa gum choose para criar o menu principal
    choice=$(gum choose "Adicionar Lofi" "Listar Lofis" "Sair")

    case "$choice" in
    "Adicionar Lofi") add_lofi ;;
    "Listar Lofis") list_lofis ;;
    "Sair")
      echo "Até mais! 👋"
      exit 0
      ;;
    *)
      echo "Até mais! 👋"
      exit 0
      ;;
    esac
  done
}

# Inicia o script
main
