#!/bin/bash
# Script para limpar logs do EAP.

# Variaveis
date=$(date +%Y-%m-%d)
folderlog=log
path_eap=/opt/EAP-x.y.z/domain/servers

# Cria file TMP
cd $path_eap
ls -l | grep -v total | cut -d ' ' -f '9' > /tmp/list_eap_directors_$date.txt

# For amigo que limpa os logs em lote
for x in $(cat /tmp/list_eap_directors_$date.txt)
do
        echo "Limpando logs do servidor em: $path_eap/$x/$folderlog"
        rm -f /tmp/list_eap_directors_$date.txt
done