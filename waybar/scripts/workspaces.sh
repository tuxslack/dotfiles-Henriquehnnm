#!/usr/bin/env bash

# Este script utiliza Pango Markup para formatar a saída de texto,
# exibindo os números das áreas de trabalho em kanji japonês.
# A área de trabalho atual é destacada em negrito e com uma cor específica.

# Mapeia os números arábicos para os kanji japoneses.
declare -A jp_numbers
jp_numbers[1]="一"
jp_numbers[2]="二"
jp_numbers[3]="三"
jp_numbers[4]="四"
jp_numbers[5]="五"
jp_numbers[6]="六"
jp_numbers[7]="七"
jp_numbers[8]="八"
jp_numbers[9]="九"

# Obtém o número total de áreas de trabalho virtuais e a área atual usando D-Bus.
COUNT=$(qdbus org.kde.KWin /VirtualDesktopManager org.kde.KWin.VirtualDesktopManager.count)
CURRENT=$(qdbus org.kde.KWin /KWin org.kde.KWin.currentDesktop)

TEXT=""
for i in $(seq 1 $COUNT); do
  # Converte o número para o kanji japonês correspondente.
  KANJI="${jp_numbers[$i]}"

  # Verifica se a área de trabalho atual é a que está sendo iterada.
  if [ "$i" -eq "$CURRENT" ]; then
    # Aplica a formatação Pango para destacar a área atual.
    # A cor '31748f' é um tom de azul escuro.
    KANJI="<span foreground='#cba6f7' weight='bold'>$KANJI</span>"
  fi

  # Concatena o número formatado à string final.
  # Adiciona três espaços entre os números.
  if [ "$i" -eq 1 ]; then
    TEXT+="$KANJI"
  else
    TEXT+="    $KANJI"
  fi
done

echo "$TEXT"
