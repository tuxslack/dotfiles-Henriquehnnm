#!/usr/bin/env bash
#
# ========================================================================================
#
# Autor:           Henrique Sardinha - https://github.com/Henriquehnnm
# Colaboração:     Fernando Souza    - https://github.com/tuxslack / https://www.youtube.com/@fernandosuporte
# Data:            05/10/2025
# Atualização em:  https://github.com/tuxslack/dotfiles-Henriquehnnm
# Script:          password-gen.sh
# Versão:          0.2
# Licença:         MIT
#
# Descrição: 
# 
# Gera múltiplas senhas seguras com comprimento definido pelo usuário, exibindo dicas de 
# gerenciamento de senhas.
# 
#
# Instalação:
#
# sudo mv -i ~/Downloads/password-gen.sh  /usr/local/bin/
#
# sudo chmod +x /usr/local/bin/password-gen.sh
#
#
# Uso: 
#
# 
# password-gen.sh
# password-gen.sh 10
# password-gen.sh 30
#
#
# ========================================================================================


clear

LENGTH="${1:-20}"
COUNT="${2:-5}"

echo -e "\n🔐 Gerando $COUNT senhas de $LENGTH caracteres...\n"


for i in $(seq 1 $COUNT); do

  password=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+=' < /dev/urandom | head -c $LENGTH)

  echo "[$i] $password"

done


echo -e "\n💡 Dica: Use um gerenciador de senhas como Bitwarden! \n"

exit 0

