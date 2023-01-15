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


sub calculaPalavrasDificeis
{
    # Pega o vetor de palavras
    my @vetorPalavras = calculaPalavras($_[0]);

    # Identifica as "palavras dificeis" e salva em um vetor
    my @palavrasDificeis = ();
    my $numSilabas = 0;
    for my $palavra (@vetorPalavras)
    {
        # Junta as silabas da palavra em uma lista vazia, e salva na variavel o tamanho final dessa lista
        $numSilabas = () = ($palavra =~ /(?:u[aáãÁÃeéÉiíÍoóÓõÕ]?[eiom]?|[íúÍÚ]|a[eou]?|iu?|o[aiu]?|[aeou][uio]?|[aáàâãÁÀÂÃeéêÉÊioóôõÓÔÕu]{1}[io]?)/ig);

        # Palavra tem 3 ou mais silabas (palavra dificil!)
        if ($numSilabas >= 3)
        {
            push(@palavrasDificeis, $palavra);
        }
    }

    # Retorna o vetor
    return @palavrasDificeis;
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
    my $quantFrases             = scalar(calculaFrases($texto));
    my $quantPalavras           = scalar(calculaPalavras($texto));
    my $quantPalavrasDificeis   = scalar(calculaPalavrasDificeis($texto));



    # Imprime os valores obtidos
    print "$quantFrases:$quantPalavras:$quantPalavrasDificeis:"
}


algoritmo();
