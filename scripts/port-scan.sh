#!/bin/bash
# Scanner de portas simples usando netcat

if [ $# -eq 0 ]; then
  echo "Uso: bash port-scan.sh <host> [porta_inicio] [porta_fim]"
  echo "Exemplo: bash port-scan.sh 192.168.0.1 20 100"
  exit 1
fi

HOST="$1"
START_PORT="${2:-1}"
END_PORT="${3:-1000}"

echo "🔍 Escaneando portas de $HOST ($START_PORT-$END_PORT)..."
echo

for port in $(seq $START_PORT $END_PORT); do
  (echo >/dev/tcp/$HOST/$port) &>/dev/null && \
    echo "✓ Porta $port: ABERTA" &
done

wait
echo
echo "Scan completo!"
