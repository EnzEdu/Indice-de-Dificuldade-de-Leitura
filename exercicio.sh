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

# Quebra os valores retornados em variaveis
NUM_FRASES=$(echo $VALORESPERL | cut -d ':' -f 1)
NUM_PALAVRAS=$(echo $VALORESPERL | cut -d ':' -f 2)
NUM_P_DIF=$(echo $VALORESPERL | cut -d ':' -f 3)
#echo "$NUM_FRASES $NUM_PALAVRAS $NUM_P_DIF"

# Media de palavras por frase (num inteiro)
MP=$(echo "$NUM_PALAVRAS/$NUM_FRASES" | bc)
echo $MP

# 
