#!C:\xampp\perl\bin
use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";

print "Introducir texto : ";

my $desplazar=5;
my $texto=<STDIN>;
chomp($texto);
my $nuevo=Puro($texto,$desplazar);
my $desencriptado=Desencriptar($nuevo,$desplazar);
say $nuevo;
say $desencriptado;

sub Puro{
    my ($texto,$desplazar)=@_;
    my $cantidadLetras=length($texto);
    my $nuevoTexto="";
    for (my $i=1;$i<=$cantidadLetras;$i++){
        my $char=chop($texto);
        my $valorAscii=ord($char);
        if ($valorAscii<=90 && $valorAscii>=65){
            $valorAscii=(($valorAscii-65+$desplazar)% 26)+65;
        }
        if ($valorAscii<=122 && $valorAscii>=97){
            $valorAscii=(($valorAscii-97+$desplazar)% 26)+97;
        }
        $nuevoTexto=chr($valorAscii).$nuevoTexto;
    }
    $nuevoTexto;
}

sub Desencriptar{
    my($texto,$desplazar)=@_;
    my $cantidadLetras=length($texto);
    my $nuevoTexto="";
    for (my $i=1;$i<=$cantidadLetras;$i++){
        my $char=chop($texto);
        my $valorAscii=ord($char);
        if ($valorAscii<=90 && $valorAscii>=65){
            $valorAscii=(($valorAscii-65-$desplazar)% 26)+65;
        }
        if ($valorAscii<=122 && $valorAscii>=97){
            $valorAscii=(($valorAscii-97-$desplazar)% 26)+97;
        }
        $nuevoTexto=chr($valorAscii).$nuevoTexto;
    }
    $nuevoTexto;
}