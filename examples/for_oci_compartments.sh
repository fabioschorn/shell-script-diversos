#!/bin/bash

echo "Insira o OCID do compartment pai?"
read compartment

echo "Qual o nome da lista dos novos compartments (Ex: lista_a.txt)?"
read lista

for x in $(cat $lista);
do
    new_compartments=$(oci iam compartment create --compartment-id $compartment --name $x --description $x)
    echo "Pronto ;-)"
done