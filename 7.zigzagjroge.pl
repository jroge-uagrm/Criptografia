#!C:\xampp\perl\bin
#use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";
use feature qw( switch );
no if $] >= 5.018, warnings => qw( experimental::smartmatch );

my$altura=5;
my $text="hola a todos";
my $nuevo=zigzag($text,$altura);
say $nuevo;
my $viejo=desZigzag($nuevo,$altura);
say$viejo;
sub zigzag{
    my($texto,$altura)=@_;
    my$nuevoTexto="";
    if($altura==1){return $text;}
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
    my@palabras=();my$n=length($texto);
    my$salto=($altura-1)*2;
    my$canPal=0;
    for(my$i=1;$i<=divi($n+$salto-1,$salto);$i++){
        push@palabras,chop($texto);
        $canPal++;
    }
    my$k=0;my$indice;
    while($k<$altura-2){
        my$divS=divi($n+$k,$salto);
        my$divO=divi($n-$k-2,$salto)+1;
        my$bulean=1;$indice=0;my$indice2=$canPal;
        if($divO==$divS){$bulean=0;$indice=1;$indice2=$canPal}
        for(my$i=1;$i<=$divS+$divO;$i++){
            if($bulean==0){
                if($k==0){
                    push@palabras,chop($texto);
                }else{
                    my$conte=$palabras[$indice2];
                    $conte=chop($texto).$conte;
                    $palabras[$indice2]=$conte;
                    $indice2++;    
                }
                $bulean=1;
            }else{
                my$conte=$palabras[$indice];
                $conte=$conte.chop($texto);
                $palabras[$indice]=$conte;
                $indice++;
                $bulean=0;
            }
        }
        $k++;
    }
    $indice=$canPal;
    for(my$l=1;$l<=divi($n,$altura+$salto)+1;$l++){
        my$conte=$palabras[$indice];
        $conte=chop($texto).$conte;
        $palabras[$indice]=$conte;
        $indice++;
    }
    my$nuevoTexto="";my$re=0;
    for(my$o=scalar@palabras-$canPal;$o>0;$o--){
        $nuevoTexto=$nuevoTexto.$palabras[$o];
        $nuevoTexto=$nuevoTexto.$palabras[scalar@palabras-$re-1];
        $re++;
    }
    $nuevoTexto=$nuevoTexto.$palabras[0];
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
sub mod{
    my ($a,$b)=@_;
    while($a>=$b && $b!=0){
        $a=$a-$b;
    }
    return $a;
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






