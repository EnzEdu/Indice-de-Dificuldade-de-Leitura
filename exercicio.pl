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
    # Abre o arquivo de texto
    open(fileHandler, '<', $pathArquivo) or die $!;

    # Percorre o texto do arquivo e salva as frases em um array
    my @frases = ();
    while (<fileHandler>)
    {
        push(@frases, $_ =~ /[^,.\n]+/g);
    }

    # Fecha o arquivo
    close(fileHandler);


    # Conserta as frases que "comecam" com whitespace
    for my $frase(@frases)
    {
        $frase = substr($frase, 1, length($frase)) if (substr($frase, 0, 1) eq " ");
    }


    # Salva a quantidade de frases
    $quantFrases = scalar(@frases);

    print "quantFrases=$quantFrases:";
}


calculaFrases();
