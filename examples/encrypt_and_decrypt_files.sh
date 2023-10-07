#!/bin/bash
#encrypt files with aes-256-cbc cipher using openssl

#encrypt files
if [ $1 == "-e" ];
then
    if [ -f "$2" ];
    then
    openssl aes-256-cbc -a -e -salt -in "$2" -out "$2.aes"
    else
       echo "This file does not exist!" 
    fi
#decrypt files
elif [ $1 == "-d" ];
then
    if [ -f "$2" ];
    then
        openssl aes-256-cbc -a -d -salt -in "$2" -out "$2.decrypt"
    else
        echo "This file does not exist!" 
    fi
#show help
elif [ $1 == "--help" ];
then
    echo "This software uses openssl for encrypting files with the aes-256-cbc cipher"
    echo "Usage for encrypting: ./encrypt_and_decrypt_files -e [file]"
    echo "Usage for decrypting: ./encrypt_and_decrypt_files -d [file]"
else
    echo "This action does not exist!"
    echo "Use ./encrypt_and_decrypt_files --help to show help."
fi