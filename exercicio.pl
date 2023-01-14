#!/usr/bin/perl
use strict;
use warnings;
use utf8;


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


sub calculaSilabas
{
    # Identifica as "sílabas" e salva em um vetor
    my @silabas = ($_[0] =~ /(?:u[aáãÁÃeéÉiíÍoóÓõÕ]?[eiom]?|[íúÍÚ]|a[eou]?|iu?|o[aiu]?|[aeou][uio]?|[aáàâãÁÀÂÃeéêÉÊioóôõÓÔÕu]{1}[io]?)/ig);

    #for my $coiso (@silabas)
    #{
    #    print "$coiso ";
    #}
    #print "\n";

    # Retorna o vetor
    return @silabas;
}


sub algoritmo
{
    # Abre o arquivo
    open(fileHandler, '<:encoding(UTF-8)', $ARGV[0]) or die $!;

    # Salva o texto do arquivo
    my $texto = "";
    while (<fileHandler>) 
    {
        $texto = $texto . $_;
    }

    # Fecha o arquivo
    close(fileHandler);



    # Algoritmo
    my $quantFrases             = 0;
    #my $quantFrases            = scalar(calculaFrases($texto));
    my $quantPalavras           = 0;
    #my $quantPalavras          = scalar(calculaPalavras($texto));
    #my $quantSilabas           = 0;
    my $quantSilabas            = scalar(calculaSilabas($texto));



    # Imprime os valores obtidos
    print "quantFrases=$quantFrases:quantPalavras=$quantPalavras:quantSilabas=$quantSilabas:"
}


algoritmo();
