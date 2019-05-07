#!C:\xampp\perl\bin
use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";

print "Introducir texto : ";
my $texto = <STDIN>;
chomp($texto);

print "Introducir clave : ";
my $clave= <STDIN>;
chomp($clave);

$texto=InvertirTexto($texto);
$clave=InvertirTexto($clave);
my $nuevo=Polialfabetico($texto,$clave);
say $nuevo;

$nuevo=InvertirTexto($nuevo);
my $desencriptado=Desencriptar($nuevo,$clave);
say $desencriptado;

sub Polialfabetico{
    my ($texto,$clave)=@_;
    $texto=InvertirTexto($texto);
    $clave=InvertirTexto($clave);
    my $cantidadLetras=length($texto);
    my $nuevoTexto="";
    for (my $i=1;$i<=$cantidadLetras;$i++){
        my $valorAsciiTexto=ord(chop($texto));
        if ($valorAsciiTexto!=32){
            my $valorAsciiClave=ord(chop($clave));
            $clave=chr($valorAsciiClave).$clave;
            if ($valorAsciiClave<=90 && $valorAsciiClave>=65){
                $valorAsciiClave=$valorAsciiClave-65;
            }else{
                $valorAsciiClave=$valorAsciiClave-97;
            }
            if ($valorAsciiTexto<=90 && $valorAsciiTexto>=65){
                $valorAsciiTexto=(($valorAsciiTexto-65+$valorAsciiClave)%26)+65;
            }
            if ($valorAsciiTexto<=122 && $valorAsciiTexto>=97){
                $valorAsciiTexto=(($valorAsciiTexto-97+$valorAsciiClave)%26)+97;
            }
        }
        $nuevoTexto=$nuevoTexto.chr($valorAsciiTexto);
    }
    $nuevoTexto;
}

sub Desencriptar{
    my ($texto,$clave)=@_;
    $texto=InvertirTexto($texto);
    $clave=InvertirTexto($clave);
    my $cantidadLetras=length($texto);
    my $nuevoTexto="";
    for (my $i=1;$i<=$cantidadLetras;$i++){
        my $valorAsciiTexto=ord(chop($texto));
        if ($valorAsciiTexto!=32){
            my $char=chop($clave);
            my $valorAsciiClave=ord($char);
            $clave=chr($valorAsciiClave).$clave;
            if ($valorAsciiClave<=90 && $valorAsciiClave>=65){
                $valorAsciiClave=$valorAsciiClave-65;
            }else{
                $valorAsciiClave=$valorAsciiClave-97;
            }
            if ($valorAsciiTexto<=90 && $valorAsciiTexto>=65){
                $valorAsciiTexto=(($valorAsciiTexto-65-$valorAsciiClave)%26)+65;
            }
            if($valorAsciiTexto<=122 && $valorAsciiTexto>=97){
                $valorAsciiTexto=(($valorAsciiTexto-97-$valorAsciiClave)%26)+97;
            }
        }
        $nuevoTexto=$nuevoTexto.chr($valorAsciiTexto);
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
    return $textoInvertido;
}
