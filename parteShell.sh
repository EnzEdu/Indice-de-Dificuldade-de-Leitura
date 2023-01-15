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


# Media de palavras por frase
MP=$(echo $NUM_PALAVRAS $NUM_FRASES | awk '{print $1 / $2}')

# Proporcao de palavras dificeis no texto
PROP_P_DIF=$(echo $NUM_P_DIF $NUM_PALAVRAS | awk '{print $1 / $2}')

# Indice de dificuldade de leitura do texto
INDICE=$(echo $MP $PROP_P_DIF | awk '{print int(0.4 * ($1 + $2) + 0.5)}')


# Resultado do script
echo $INDICE
