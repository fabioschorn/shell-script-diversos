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
        tar -zcvf $path_eap/$x/$folderlog/server_log_collection_$date.tar.gz $path_eap/$x/$folderlog/server.log.*
        rm -f $path_eap/$x/$folderlog/server.log.*
        rm -f /tmp/list_eap_directors_$date.txt
done