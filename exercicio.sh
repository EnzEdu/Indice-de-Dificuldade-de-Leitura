#!/bin/bash


# Tratamento dos argumentos do script
if [ $# -eq 0 ] 
then
    echo "Forneca um arquivo para o script!"
    exit 1
elif [ $# -ge 2 ]
then
    echo "O script recebeu muitos argumentos!"
    exit 1
fi


# Salva o path do arquivo passado como argumento
PATHARQUIVO=$1

# Envia o arquivo para o script em perl e salva os resultados
VALORESPERL=$(perl ./exercicio.pl $PATHARQUIVO)


# Impressao (temporario)
echo " "
echo "$VALORESPERL"

