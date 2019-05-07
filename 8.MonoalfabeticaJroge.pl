#!C:\xampp\perl\bin
#use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";
<<<<<<< HEAD
my$nuevoAlfabeto="rbcdefghijklmn".chr(195)."opqsatuvwxyz";
my $texto="ñ";
=======
use feature qw( switch );
no if $] >= 5.018, warnings => qw( experimental::smartmatch );
my$nuevoAlfabeto="rbcdefghijklmnñopqsatuvwxyz";
my $texto="a";
>>>>>>> 0c125952a5c624213161182bfe90feb08a16eae6
my $nuevo=Mono($texto,$nuevoAlfabeto);
say $nuevo;
my$viejo=desMono($nuevo,$nuevoAlfabeto);
say $viejo;
sub mono{
    my ($texto,$nuevoAlfabeto)=@_;
    my$nuevoTexto;
    my$n=length($texto);
    if($n==0){
        $nuevoTexto="";
    }else{
        my$cha=chop($texto);
        $nuevoTexto=mono($texto,$nuevoAlfabeto);
        my$asi=index("abcdefghijklmn".chr(164)."opqrstuvwxyz",$cha);
        my$bol=0;
        if($asi<0){
            $bol=1;
            if(ord($cha)==165){
                $cha=chr(164);
            }else{
                $cha=(lc($cha));
            }
            $asi=index("abcdefghijklmn".chr(164)."opqrstuvwxyz",$cha);
        }
        if($asi>=0){
            for(my $i=1;$i<=27-$asi;$i++){
                $cha=chop($nuevoAlfabeto);
            }
            if($bol==1){
                if(ord($cha) eq 164){
                    $cha=chr(165);
                }
                $cha=uc($cha);
            }
        }
        $nuevoTexto=$nuevoTexto.$cha;
    }
    return $nuevoTexto;
}
sub desMono{
    my ($texto,$nuevoAlfabeto)=@_;
    my$nuevoTexto;
    my$n=length($texto);
    if($n==0){
        $nuevoTexto="";
    }else{
        my$cha=chop($texto);
        $nuevoTexto=desMono($texto,$nuevoAlfabeto);
        my$asi=index($nuevoAlfabeto,$cha);
        my$bol=0;
        if($asi<0){
            $bol=1;
            if(ord($cha)==165){
                $cha=chr(164);
            }else{
                $cha=(lc($cha));
            }
            $asi=index($nuevoAlfabeto,$cha);
        }
        if($asi>=0){
            my$alfabetoReal="abcdefghijklmn".chr(164)."opqrstuvwxyz";
            for(my $i=1;$i<=27-$asi;$i++){
                $cha=chop($alfabetoReal);
            }
            if($bol==1){
                if(ord($cha) eq 164){
                    $cha=chr(165);
                }
                $cha=uc($cha);
            }
        }
        $nuevoTexto=$nuevoTexto.$cha;
    }
    return $nuevoTexto;
}