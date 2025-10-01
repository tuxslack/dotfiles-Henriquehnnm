#!/bin/bash

# Colors in RGB
START_R=$((0xfa))
START_G=$((0xb3))
START_B=$((0x87))

END_R=$((0xcb))
END_G=$((0xa6))
END_B=$((0xf7))

# Logo content
logo=(
  ""
  " ██████████            █████       ███                      "
  " ░░███░░░░███          ░░███      ░░░                       "
  "  ░███   ░░███  ██████  ░███████  ████   ██████   ████████  "
  "  ░███    ░███ ███░░███ ░███░░███░░███  ░░░░░███ ░░███░░███ "
  "  ░███    ░███░███████  ░███ ░███ ░███   ███████  ░███ ░███ "
  "  ░███    ███ ░███░░░   ░███ ░███ ░███  ███░░███  ░███ ░███ "
  "  ██████████  ░░██████  ████████  █████░░████████ ████ █████"
  " ░░░░░░░░░░    ░░░░░░  ░░░░░░░░  ░░░░░  ░░░░░░░░ ░░░░ ░░░░░"
  ""
)

# Pega tamanho do terminal
term_width=$(tput cols)
term_height=$(tput lines)

# Só mostra se for maior que 125x20
if ((term_width < 125 || term_height < 20)); then
  exit 0
fi

lines=${#logo[@]}

for ((i = 0; i < lines; i++)); do
  line="${logo[$i]}"
  line_length=${#line}

  # Gradiente
  perc=$(bc -l <<<"scale=4; $i / ($lines - 1)")
  r=$(bc -l <<<"scale=0; $START_R + ($END_R - $START_R) * $perc")
  g=$(bc -l <<<"scale=0; $START_G + ($END_G - $START_G) * $perc")
  b=$(bc -l <<<"scale=0; $START_B + ($END_B - $START_B) * $perc")

  # Imprime
  printf "%*s" $padding ""
  printf "\033[38;2;%d;%d;%dm%s\033[0m\n" ${r%.*} ${g%.*} ${b%.*} "$line"
done
