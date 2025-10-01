#!/bin/bash
# Gerador de senhas seguras

LENGTH="${1:-20}"
COUNT="${2:-5}"

echo "🔐 Gerando $COUNT senhas de $LENGTH caracteres..."
echo

for i in $(seq 1 $COUNT); do
  password=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+=' < /dev/urandom | head -c $LENGTH)
  echo "[$i] $password"
done

echo
echo "💡 Dica: Use um gerenciador de senhas como Bitwarden!"
