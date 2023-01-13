#!/bin/bash

# Salva o path do arquivo passado como argumento
PATHARQUIVO=$1

# Envia o arquivo para o script em perl e salva os resultados
VALORESPERL=$(perl ./exercicio.pl $PATHARQUIVO)



# Impressao (temp)
echo " "
echo "$VALORESPERL"

