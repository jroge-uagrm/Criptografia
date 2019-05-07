#!C:\xampp\perl\bin
#use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";
use feature qw( switch );
no if $] >= 5.018, warnings => qw( experimental::smartmatch );

my $text="holax";
my $nuevo=serie($text);
say $nuevo;
my $viejo=desSerie($nuevo);
say$viejo;

sub serie{
    my($texto)=@_;
    my$textoA="";my$textoB="";
    if(mod(length($texto),2)==1){
        $textoB=chop($texto);
    }
    my$n=length($texto);
    for(my$i=1;$i<=divi($n,2);$i++){
        $textoA=chop($texto).$textoA;
        $textoB=chop($texto).$textoB;
    }
    my$nuevoTexto=$textoA.$textoB;
    return $nuevoTexto;
}
sub desSerie{
    my($texto)=@_;
    my$textoA="";my$textoB="";
    my$cha="";
    if(mod(length($texto),2)==1){
        $cha=chop($texto);
    }
    my$n=length($texto);
    for(my$i=1;$i<=divi($n,2);$i++){
        $textoA=$textoA.chop($texto);
        $textoB=$textoB.chop($texto);
    }
    my$nuevoTexto=$textoB.$textoA.$cha;
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
sub mod{
    my ($a,$b)=@_;
    while($a>=$b && $b!=0){
        $a=$a-$b;
    }
    return $a;
}