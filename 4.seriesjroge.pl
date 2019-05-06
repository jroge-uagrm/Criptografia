#!C:\xampp\perl\bin
#use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";
use feature qw( switch );
no if $] >= 5.018, warnings => qw( experimental::smartmatch );

my$altura=4;
my $text="";
say length($text);
my $nuevo=zigzag($text,$altura);
say $nuevo;

sub zigzag{
    my($texto,$altura)=@_;
    my$nuevoTexto="";
        for(my$i=0;$i<$altura;$i++){
            if(divi(length($texto),$altura)<=1){
                if($i==0){
                    $nuevoTexto=$nuevoTexto.charIn($texto,($altura-1));
                }else{
                    $nuevoTexto=$nuevoTexto.charIn($texto,(($altura-1)-$i));
                    $nuevoTexto=$nuevoTexto.charIn($texto,(($altura-1)+$i));
                }
            }else{
                for(my$j=1;$j<=divi(length($texto),$altura);$j++){
                    if($i==0){
                        $nuevoTexto=$nuevoTexto.charIn($texto,($altura-1)+((($altura-1)*2)*($j-1)));
                    }else {
                        $nuevoTexto=$nuevoTexto.charIn($texto,(($altura-1)+((($altura-1)*2)*($j-1)))-$i);
                        if($i!=($altura-1)){
                            $nuevoTexto=$nuevoTexto.charIn($texto,(($altura-1)+((($altura-1)*2)*($j-1)))+$i);
                        }
                    }
                }
            }
        }
    return $nuevoTexto;
}
sub desZigzag{
    my ($texto,$altura)=@_;
    my$nuevoTexto="";

    return $nuevoTexto;
}
sub divi{
    my ($a,$b)=@_;
    my$res=0;
    while($a>=$b && $b!=0){
        $a=$a-$b;
        $res++;
    }
    return $res;
}
sub charIn{
    my($textoAux,$pos)=@_;
    my$cha="";
    my$m=length($textoAux)-$pos;
    for(my$k=1;$k<=$m;$k++){
        $cha=chop($textoAux);
    }
    if(ord($cha)==241){
        return chr(164);
    }else{
        if(ord($cha)==209){
            return chr(165);
        }else{
            return $cha;
        }
    }
}






