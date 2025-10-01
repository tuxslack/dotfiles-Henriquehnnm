#!/bin/bash
# Timer Pomodoro simples no terminal

WORK_TIME=${1:-25}
BREAK_TIME=${2:-5}

notify() {
  if command -v notify-send >/dev/null; then
    notify-send -u critical "Pomodoro" "$1"
  fi
  echo -e "\n🔔 $1"
  echo -ne '\007'
}

countdown() {
  local seconds=$((60 * $1))
  local desc="$2"
  while [ $seconds -gt 0 ]; do
    echo -ne "\r⏱️  $desc: $(printf '%02d:%02d' $((seconds/60)) $((seconds%60)))   "
    sleep 1
    : $((seconds--))
  done
  echo
}

cycle=1
while true; do
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "🍅 Pomodoro #$cycle - FOCO TOTAL"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  countdown $WORK_TIME "Trabalho"
  notify "⏰ Trabalho finalizado! Hora do descanso."
  
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "☕ Pausa - Relaxa aí"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  countdown $BREAK_TIME "Pausa"
  notify "🔥 Pausa acabou! Bora pro próximo ciclo."
  
  : $((cycle++))
  echo
done
