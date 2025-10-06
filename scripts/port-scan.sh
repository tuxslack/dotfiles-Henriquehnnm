#!/usr/bin/env bash
#
# ========================================================================================
#
# Autor:           Henrique Sardinha - https://github.com/Henriquehnnm
# Colaboração:     Fernando Souza    - https://github.com/tuxslack / https://www.youtube.com/@fernandosuporte
# Data:            05/10/2025
# Atualização em:  https://github.com/tuxslack/dotfiles-Henriquehnnm
# Script:          port-scan.sh
# Versão:          0.2
# Licença:         GPLv3
#
# Descrição: 
# 
# 
# É um scanner de portas TCP em Bash que verifica um intervalo de portas (START a END) no 
# HOST passado como argumento. Ele usa paralelismo controlado (semáforo via FIFO) e um 
# timeout por tentativa para evitar travamentos. Mostra apenas as portas abertas.
#
# port-scan.sh localhost 1 1000 200
# argumentos:
# 1 = host (obrigatório)
# 2 = porta inicial (opcional, padrão 1)
# 3 = porta final (opcional, padrão 1000)
# 4 = concorrência máxima (opcional, padrão 200)
#
#
# Limitações e pontos de atenção
#
# Não distingue portas "filtradas" de "fechadas".
#
# O timeout em 1s pode ser curto em redes lentas; ajuste TO conforme necessário.
#
# Ainda cria até CONCURRENCY processos simultâneos; valores muito altos podem esgotar 
# recursos.
#
# Resultados podem aparecer fora de ordem (background jobs).
#
# Escanear redes/hosts sem autorização pode ser ilegal ou considerado intrusão — use apenas 
# em hosts que você administra ou com permissão explícita.
#
# Em alguns sistemas, >/dev/tcp/host/port requer permissões/ambiente que podem variar.
#
#
# Usar nc -z -w1 host port ou nmap para varreduras mais completas e robustas:
#
# nc -z -w1 host port (netcat)
#
# nmap -sT -p1-1024 host (nmap — muito mais poderoso)
#
# 
# 
#
# Instalação:
#
# sudo mv -i ~/Downloads/port-scan.sh  /usr/local/bin/
#
# sudo chmod +x /usr/local/bin/port-scan.sh
#
#
# Uso: 
#
# port-scan.sh <host> [start] [end] [concurrency]
#
# port-scan.sh localhost 1 1000 200
#
#
# ========================================================================================


clear


HOST="$1"
START="${2:-1}"
END="${3:-1000}"
CONCURRENCY="${4:-200}"  # max de processos simultâneos

# Aumentar TO para redes lentas (ex.: TO=2).

TO=2                     # Timeout em segundos (por tentativa)


if [ -z "$HOST" ]; then

  echo -e "\nUso: $0 <host> [start] [end] [concurrency]\n"

  exit 1

fi

# Criar fifo para semáforo

FIFO="/tmp/portscan-$$.fifo"
mkfifo "$FIFO"
exec 3<>"$FIFO"
rm "$FIFO"

# Inicializar tokens

for i in $(seq 1 $CONCURRENCY); do
  echo >&3
done

echo -e "\nEscaneando $HOST portas $START-$END (concorrência $CONCURRENCY)...\n"

for port in $(seq $START $END); do
  read -u3  # Pega um token (bloqueia se não houver)
  {
    if timeout $TO bash -c ">/dev/tcp/$HOST/$port" 2>/dev/null; then
      echo "✓ Porta $port: ABERTA"
    fi
    echo >&3  # Devolve o token
  } &
done

wait
exec 3>&-
echo -e "\nScan completo! \n"



exit 0

