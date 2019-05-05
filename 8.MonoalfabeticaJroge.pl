#!C:\xampp\perl\bin
use warnings;
use strict;
#use utf8;
use 5.010;#Para say
use feature "switch";
my$nuevoAlfabeto="rbcdefghijklmn".chr(195)."opqsatuvwxyz";
my $texto="a";
my $nuevo=Mono($texto,$nuevoAlfabeto);
say $nuevo;
my$viejo=desMono($nuevo,$nuevoAlfabeto);
say $viejo;
sub Mono{
    my ($texto,$nuevoAlfabeto)=@_;
    my$nuevoTexto;
    my$n=length($texto);
    if($n==0){
        $nuevoTexto="";
    }else{
        my$cha=chop($texto);
        if(ord($cha) eq 177){
            $cha=chop($texto);
        }
        $nuevoTexto=Mono($texto,$nuevoAlfabeto);
        my$asi=index("abcdefghijklmn".chr(195)."opqrstuvwxyz",$cha);
        my$bol=0;
        if($asi<0){
            $bol=1;
            $cha=(lc($cha));
            $asi=index("abcdefghijklmn".chr(195)."opqrstuvwxyz",$cha);
        }
        if($asi>=0){
            for(my $i=1;$i<=27-$asi;$i++){
                $cha=chop($nuevoAlfabeto);
            }
            if($bol==1){
                $cha=uc($cha);
            }
        }
        if(ord($cha)==195){
            $nuevoTexto=$nuevoTexto."ñ";
        }else{
            $nuevoTexto=$nuevoTexto.$cha;
        }
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
        if(ord($cha) eq 177){
            $cha=chop($texto);
        }
        $nuevoTexto=Mono($texto,$nuevoAlfabeto);
        my$asi=index($nuevoAlfabeto,$cha);
        my$bol=0;
        if($asi<0){
            $bol=1;
            $cha=(lc($cha));
            $asi=index($nuevoAlfabeto,$cha);
        }
        if($asi>=0){
            $nuevoAlfabeto="abcdefghijklmn".chr(195)."opqrstuvwxyz";
            for(my $i=1;$i<=27-$asi;$i++){
                $cha=chop($nuevoAlfabeto);
            }
            if($bol==1){
                $cha=uc($cha);
            }
        }
        if(ord($cha)==195){
            $nuevoTexto=$nuevoTexto."ñ";
        }else{
            $nuevoTexto=$nuevoTexto.$cha;
        }
    }
    return $nuevoTexto;
}