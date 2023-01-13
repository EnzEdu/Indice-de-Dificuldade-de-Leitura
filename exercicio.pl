#!/usr/bin/perl
use strict;
use warnings;


sub calculaFrases
{
    # Identifica as frases e salva em um vetor
    my @frases = ($_[0] =~ /[^,.\n]+/g);

    # Retorna o tamanho do vetor
    return scalar(@frases);
}


sub calculaPalavras
{
}


sub calculaPalavrasDificeis
{
}


sub algoritmo
{
    # Abre o arquivo
    open(fileHandler, '<', $ARGV[0]) or die $!;

    # Salva o texto do arquivo
    my $texto = "";
    while (<fileHandler>) 
    {
        $texto = $texto . $_;
    }

    # Fecha o arquivo
    close(fileHandler);



    # Algoritmo
    my $quantFrases = calculaFrases($texto);
    my $quantPalavras = 0;
    #my $quantPalavras = calculaPalavras($texto);
    my $quantPalavrasDificeis = 0;
    #my $quantPalavrasDificeis = calculaPalavrasDificeis($texto);



    # Imprime os valores obtidos
    print "quantFrases=$quantFrases:quantPalavras=$quantPalavras:quantPalavrasDificeis=$quantPalavrasDificeis:"
}


algoritmo();
