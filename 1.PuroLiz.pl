#!C:\xampp\perl\bin
use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";


print "Introducir texto : ";

my $desplazar=1;
my $texto=<STDIN>;
chop($texto);
my $nuevo=Puro($texto,$desplazar);
my $desencriptado=Desencriptar($nuevo,$desplazar);
say $nuevo;
say $desencriptado;
sub Puro{
    my ($texto,$desplazar)=@_;
    my $cantidadLetras=length($texto);
    my $nuevoTexto = "";
    for (my $i=1;$i<=$cantidadLetras;$i++){
        my $char=chop($texto);
        my $valorAscii=ord($char);
        if ($valorAscii!=50){ #Si es diferente de espacio
            if ($valorAscii==165){ #Si es la Ñ
                $valorAscii=81;
            }else{
                if ($valorAscii==164){ #Si es la ñ
                    $valorAscii=113;
                }else{
                    if ($valorAscii<=90 && $valorAscii>=65){ #Si es una letra mayuscula
                        if ($valorAscii==76){ #Si es la L
                            $valorAscii=165;
                        }else{
                            $valorAscii=(($valorAscii-65+$desplazar)% 26)+65;
                            if ($valorAscii==80 || $valorAscii==81){ #Si es M o N
                                $valorAscii=$valorAscii-1;
                            }
                        }
                    }
                    if ($valorAscii<=122 && $valorAscii>=97){
                        if ($valorAscii==108){
                            $valorAscii=164;
                        }else{
                            $valorAscii=(($valorAscii-97+$desplazar)% 26)+97;
                            if($valorAscii==112 || $valorAscii==113){
                                $valorAscii=$valorAscii-1;
                            }                        
                        }
                    }
                    
                }
            }
        }
        $nuevoTexto=chr($valorAscii).''.$nuevoTexto;
    }
    $nuevoTexto;
}

sub Desencriptar{
    my ($texto,$desplazar)=@_;
    my $cantidadLetras=length($texto);
    my $nuevoTexto = "";
    for (my $i=1;$i<=$cantidadLetras;$i++){
        my $char=chop($texto);
        my $valorAscii=ord($char);
        if ($valorAscii!=50){
            if ($valorAscii==165){
                $valorAscii=76;
            }else{
                if ($valorAscii==164){
                    $valorAscii=108;
                }else{
                    if ($valorAscii<=90 && $valorAscii>=65){
                        if ($valorAscii==81){
                            $valorAscii=165;
                        }else{
                            $valorAscii=(($valorAscii-65-$desplazar)% 26)+65;
                            if ($valorAscii==76 || $valorAscii==77){
                                $valorAscii=$valorAscii+1;
                            }
                        }
                    }
                    if ($valorAscii<=122 && $valorAscii>=97){
                        if ($valorAscii==113){
                            $valorAscii=164;
                        }else{
                            $valorAscii=(($valorAscii-97-$desplazar)% 26)+97;
                            if($valorAscii==108 || $valorAscii==109){
                                $valorAscii=$valorAscii+1;
                            }                        
                        }
                    }
                    
                }
            }
        }
        $nuevoTexto=chr($valorAscii).''.$nuevoTexto;
    }
    $nuevoTexto;
}