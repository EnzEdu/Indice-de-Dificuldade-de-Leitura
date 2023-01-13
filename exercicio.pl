#!/usr/bin/perl
use strict;
use warnings;


sub calculaFrases
{
    # Identifica as frases e salva em um vetor
    my @frases = ($_[0] =~ /[^,.\n]+/g);

    # Retorna o vetor
    return @frases;
}


sub calculaPalavras
{
    # Identifica as palavras e salva em um vetor
    my @palavras = ($_[0] =~ /\w+/g);

    # Retorna o vetor
    return @palavras;
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
    my $quantFrases             = scalar(calculaFrases($texto));
    my $quantPalavras           = scalar(calculaPalavras($texto));
    my $quantPalavrasDificeis   = 0;
    #my $quantPalavrasDificeis  = scalar(calculaPalavrasDificeis($texto));



    # Imprime os valores obtidos
    print "quantFrases=$quantFrases:quantPalavras=$quantPalavras:quantPalavrasDificeis=$quantPalavrasDificeis:"
}


algoritmo();
