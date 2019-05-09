#!C:\xampp\perl\bin
use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";
use Data::Dumper;

print "Introducir texto : ";

my $desplazar=5;
my $texto=<STDIN>;
chomp($texto);
my $nuevo=Columnas2($texto,$desplazar);
say $nuevo;

my $desencriptado=Desencriptar2($nuevo,$desplazar);
say $desencriptado;

sub Columnas2{
    my ($texto,$desplazar)=@_;
    $texto=InvertirTexto($texto);
    my $cantidadLetras=length($texto);
    my $nuevoTexto="";
    my $cantidad=0;
    my $contador=0;
    my @matriz;
    for (my $i=1;$i<=$cantidadLetras;$i++){
        my $char=chop($texto);
        if ($contador<$desplazar){
            push(@{$matriz[$cantidad]},$char);
            $contador++;
        }
        if ($contador==$desplazar && length($texto)>0){
            $cantidad++;
            $contador=0;
        }
    }
    $contador=0;
    for (my $i=1;$i<=$cantidadLetras;$i++){
        if ($contador<=$cantidad && scalar @{$matriz[$contador]}>0){
            $nuevoTexto=$nuevoTexto.shift(@{$matriz[$contador]});
            $contador++;
        }else{
            $cantidadLetras++;
            $contador=0;
        }
        if ($contador>$cantidad){
            $contador=0;
        }
    }
    $nuevoTexto;
}

sub Desencriptar2{
    my ($texto,$desplazar)=@_;
    $texto=InvertirTexto($texto);
    my $cantidadLetras=length($texto);
    my $nuevoTexto="";
    my $cantidad=$cantidadLetras/$desplazar;
    my $avanzar=0;
    my @array;
    for (my $i=1;$i<=$desplazar;$i++){
        my $contador=0;
        my $char="";
        while ($contador<$cantidad){
            $char=$char.chop($texto);
            $contador++;
            if (length($texto)<=$desplazar-$avanzar-1){
                $contador++;
            }
        }
        push(@array,$char);
        $avanzar++;
    }
    my $contador=0;
    while ($contador<$cantidad){
        for (my $i=0;$i<$desplazar;$i++){ 
            my $char=shift(@array);
            if (length($char)!=0){
                $char=InvertirTexto($char);
                $nuevoTexto=$nuevoTexto.chop($char);
                $char=InvertirTexto($char);
                push(@array,$char);
            }
        }
        $contador++;
    }
    $nuevoTexto;
}

sub InvertirTexto{
    my ($textoAInvertir)=@_;
    my $cantidad=length($textoAInvertir);
    my $textoInvertido="";
    for (my $i=1;$i<=$cantidad;$i++){
        $textoInvertido=$textoInvertido.chop($textoAInvertir);
    }
    $textoInvertido;
}