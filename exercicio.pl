#!/usr/bin/perl
use strict;
use warnings;


my $pathArquivo = $ARGV[0];
my $quantFrases = 0;
#my $quantPalavras = 0;
#my $quantPalavrasDificeis = 0;
#my $proporcaoPalavrasDificeis = 0;
#my $indice = 0;


sub calculaFrases
{
    # Conta o numero de frases no texto
    my @frases = ($_[0] =~ /[^,.\n]+/g);

    # Conserta as frases que "comecam" com whitespace
    #for my $frase(@frases)
    #{
        #$frase = substr($frase, 1, length($frase)) if (substr($frase, 0, 1) eq " ");
    #}

    # Salva na variavel
    $quantFrases = scalar(@frases);

    print "quantFrases=$quantFrases:";
}


sub algoritmo
{
    # Abre o arquivo
    open(fileHandler, '<', $pathArquivo) or die $!;

    # Salva o texto do arquivo
    my $texto = "";
    while (<fileHandler>) 
    {
        $texto = $texto . $_;
    }

    # Fecha o arquivo
    close(fileHandler);


    # Algoritmo
    calculaFrases($texto);
}


algoritmo();
