#!C:\xampp\perl\bin
#use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";
use feature qw( switch );
no if $] >= 5.018, warnings => qw( experimental::smartmatch );
# my$dfghj=chr(164);
# my$qqq=chop($dfghj);
# say $qqq;
# say ord($qqq);
print"\n-------------------------------------------------\n";
print"PROYECTO#1 DE CRIPTOGRAFIA Y SEGURIDAD         ||";
my $op;my$n;my$correcto;
my$ruta;my$nombreArchivo;my$direccion;my$contenido;my$palabraClave;my$archivo;my$iniciar;
$iniciar=1;
while($iniciar==1){
    $op=0;
    while($op==0){
        print"\n-------------------------------------------------\n";
        print"                                               ||\n";
        print "MENU:                                          ||\n";
        print "1. Abrir un archivo para encriptar             ||\n";
        print "2. Ingresar texto para encriptar               ||\n";
        print "3. Abrir un archivo para desencriptar          ||\n";
        print "4. Ingresar texto para desencriptar            ||\n";
        print "0. Salir                                       ||\n";
        print "SELECCIONA UNA OPCION: ";chomp ($op=<STDIN>);
        $correcto=0;
        given($op){
            when($_ eq "1"){                    #ARCHIVO-ENCRIPTAR
                while($correcto==0){
                    print"-----------------------------------------------||\n";
                    print "RUTA DE LA CARPETA DEL ARCHIVO: ";
                    chomp ($ruta=<STDIN>);
                    print "NOMBRE DEL ARCHIVO: ";
                    chomp ($nombreArchivo=<STDIN>);
                    $direccion=$ruta."/".$nombreArchivo.".txt";
                    if(open($archivo,"<$direccion")){
                        print"-----------------------------------------------||\n";
                        print"ARCHIVO ABIERTO:\n\n";
                        while(<$archivo>){
                                    chomp;
                                $contenido= $_;
                                say $contenido;
                        }
                        close($archivo);
                        $contenido="";
                        $correcto=1;
                    }else{
                        print"-----------------------------------------------||\n";
                        print "ARCHIVO NO EXISTE\n";
                        $correcto=0;
                    }
                }
                $op=1;
            }
            when($_ eq "2"){                    #TEXTO-ENCRIPTAR
                print "\nIntroducir texto: ";chomp ($contenido=<STDIN>);
                $op=1;
            }
            when($_ eq "3"){                    #ARCHIVO-DESENCRIPTAR
                while($correcto==0){
                    print"-----------------------------------------------||\n";
                    print "RUTA DE LA CARPETA DEL ARCHIVO: ";
                    chomp ($ruta=<STDIN>);
                    print "NOMBRE DEL ARCHIVO: ";
                    chomp ($nombreArchivo=<STDIN>);
                    $direccion=$ruta."/".$nombreArchivo.".txt";
                    if(open($archivo,"<$direccion")){
                        print"-----------------------------------------------||\n";
                        print"ARCHIVO ABIERTO:\n\n";
                        while(<$archivo>){
                                    chomp;
                                $contenido= $_;
                                say $contenido;
                        }
                        close($archivo);
                        $contenido="";
                        $correcto=1;
                    }else{
                        print"-----------------------------------------------||\n";
                        print "ARCHIVO NO EXISTE\n";
                        $correcto=0;
                    }
                }
                $op=2;
            }
            when($_ eq "4"){                    #TEXTO-DESENCRIPTAR
                print "\nIntroducir texto: ";chomp ($contenido=<STDIN>);
                $op=2;
            }
            when($_ eq "0"){
                $op=3;
            }
            default{
                print"-------------------------------------------------\n";
                print "OPCION INCORRECTA\n";
                print"-------------------------------------------------\n";
                $op=0;
            }
        }
    }
    if($op != 3){
                my$en=$op;
                $op=0;
                while($op==0){
                    print "\n-----------------------------------------------||\n";
                    print "SELECCIONE EL METODO DE ";
                    if($en==1){print"ENCRIPTACION:          ||\n";}else{print"DESENCRIPTACION:       ||\n";}
                    print "1. Deslizamiento puro                          ||\n";
                    print "2. Deslizamiento puro con palabra clave        ||\n";
                    print "3. Transposicion por grupos                    ||\n";
                    print "4. Transposicion por series                    ||\n";
                    print "5. Transposicion por columnas                  ||\n";
                    print "6. Transposicion por filas                     ||\n";
                    print "7. Transposicion por zigzag                    ||\n";
                    print "8. Sustitucion mono alfabetica                 ||\n";
                    print "9. Sustitucion poli alfabetica                 ||\n";
                    print "SELECCIONA UNA OPCION: ";chomp ($op=<STDIN>);
                    $correcto=0;
                    given($op){
                            when($_ eq "1"){
                                $op=1;
                                while($correcto==0){
                                    print "-----------------------------------------------||\n";
                                    print "1. DESLIZAMIENTO PURO\n";
                                    print "Introduzca la cantidad de desplazamientos: ";chomp($n=<STDIN>);
                                    if(esNumero($n)){
                                        $correcto=1;
                                        print "-----------------------------------------------||\n";
                                        print "ARCHIVO ";
                                        if($en==1){print"ENCRIPTADO!\n\n";}else{print"DESENCRIPTADO!\n\n";}
                                        if(length($contenido)>0){
                                            if($en==1){
                                                #NUMERO 1
                                            }else{
                                                #NUMERO 1
                                            }
                                        }else{
                                            my$archivoAux;my$nombreArchivoAux;
                                            if($en==1){
                                                $nombreArchivoAux=$nombreArchivo."ENCRIPTADO";
                                            }else{
                                                $nombreArchivoAux=$nombreArchivo."DESENCRIPTADO";
                                            }
                                            my$direccionAux=$ruta."/".$nombreArchivoAux.".txt";
                                            open($archivoAux,">$direccionAux");
                                            print$archivoAux "";
                                            close($archivoAux);
                                            open($archivoAux,">>$direccionAux");
                                            open($archivo,"<$direccion");
                                            while(<$archivo>){
                                                        chomp;
                                                    $contenido= $_;
                                                    my$encriptacion;
                                                    if($en==1){
                                                        #$encriptacion=NUMERO 1
                                                    }else{
                                                        #$encriptacion=NUMERO 1
                                                    }
                                                    #say$encriptacion;
                                                    #print $archivoAux $encriptacion."\n";
                                            }
                                            close($archivo);
                                            close($archivoAux);
                                            print "-----------------------------------------------||\n";
                                        }
                                    }else{
                                        print"-------------------------------------------------\n";
                                        print "DATO INCORRECTO\n";
                                        $correcto=0;
                                    }
                                }
                            }
                            when($_ eq "2"){
                                $op=1;
                                while($correcto==0){
                                    print "-----------------------------------------------||\n";
                                    print "2. DESLIZAMIENTO PURO CON PALABRA CLAVE\n";
                                    print "Introduzca la palabra clave: ";chomp($palabraClave=<STDIN>);
                                    if(esPalabra($palabraClave)){
                                        $correcto=1;
                                    }else{
                                        print"-------------------------------------------------\n";
                                        print "PALABRA NO VALIDA\n";
                                        $correcto=0;
                                    }
                                }
                                $correcto=0;
                                while($correcto==0){
                                    print "\nIntroduzca la cantidad de desplazamientos: ";chomp($n=<STDIN>);
                                    if(esNumero($n)){
                                        $correcto=1;
                                        print "-----------------------------------------------||\n";
                                        print "ARCHIVO ";
                                        if($en==1){print"ENCRIPTADO!\n\n";}else{print"DESENCRIPTADO!\n\n";}
                                        if(length($contenido)>0){
                                            if($en==1){
                                                #NUMERO 2   
                                            }else{
                                                #NUMERO 2
                                            }
                                        }else{
                                            my$archivoAux;my$nombreArchivoAux;
                                            if($en==1){
                                                $nombreArchivoAux=$nombreArchivo."ENCRIPTADO";
                                            }else{
                                                $nombreArchivoAux=$nombreArchivo."DESENCRIPTADO";
                                            }
                                            my$direccionAux=$ruta."/".$nombreArchivoAux.".txt";
                                            open($archivoAux,">$direccionAux");
                                            print$archivoAux "";
                                            close($archivoAux);
                                            open($archivoAux,">>$direccionAux");
                                            open($archivo,"<$direccion");
                                            while(<$archivo>){
                                                        chomp;
                                                    $contenido= $_;
                                                    my$encriptacion;
                                                    if($en==1){
                                                        #$encriptacion=NUMERO 1
                                                    }else{
                                                        #$encriptacion=NUMERO 1
                                                    }
                                                    #say$encriptacion;
                                                    #print $archivoAux $encriptacion."\n";
                                            }
                                            close($archivo);
                                            close($archivoAux);
                                            print "-----------------------------------------------||\n";
                                        }
                                    }else{
                                        print"-------------------------------------------------\n";
                                        print "DATO INCORRECTO\n";
                                        print"-------------------------------------------------\n";
                                        $correcto=0;
                                    }
                                }
                            }
                            when($_ eq "7"){
                                $op=1;
                                while($correcto==0){
                                    print "-----------------------------------------------||\n";
                                    print "7. TRANSPOSICION POR ZIGZAG\n";
                                    print "Introduzca la altura: ";chomp($n=<STDIN>);
                                    if(esNumero($n)){
                                        $correcto=1;
                                        print "-----------------------------------------------||\n";
                                        print "ARCHIVO ";
                                        if($en==1){print"ENCRIPTADO!\n\n";}else{print"DESENCRIPTADO!\n\n";}
                                        if(length($contenido)>0){
                                            if($en==1){
                                                say zigzag($contenido,$n);
                                            }else{
                                                say desZigzag($contenido,$n);
                                            }
                                        }else{
                                            my$archivoAux;my$nombreArchivoAux;
                                            if($en==1){
                                                $nombreArchivoAux=$nombreArchivo."ENCRIPTADO";
                                            }else{
                                                $nombreArchivoAux=$nombreArchivo."DESENCRIPTADO";
                                            }
                                            my$direccionAux=$ruta."/".$nombreArchivoAux.".txt";
                                            open($archivoAux,">$direccionAux");
                                            print$archivoAux "";
                                            close($archivoAux);
                                            open($archivoAux,">>$direccionAux");
                                            open($archivo,"<$direccion");
                                            while(<$archivo>){
                                                        chomp;
                                                    $contenido= $_;
                                                    my$encriptacion;
                                                    if($en==1){
                                                        $encriptacion=zigzag($contenido,$n);
                                                    }else{
                                                        $encriptacion=desZigzag($contenido,$n);
                                                    }
                                                    say$encriptacion;
                                                    print $archivoAux $encriptacion."\n";
                                            }
                                            close($archivo);
                                            close($archivoAux);
                                            print "-----------------------------------------------||\n";
                                        }
                                    }else{
                                        print"-------------------------------------------------\n";
                                        print "DATO INCORRECTO\n";
                                        $correcto=0;
                                    }
                                }
                            }
                            when($_ eq "8"){
                                my$alfabeto;
                                while($correcto==0){
                                    print "-----------------------------------------------||\n";
                                    print "8. DESLIZAMIENTO PURO\n";
                                    print "Introduzca su alfabeto: ";chomp($alfabeto=<STDIN>);
                                    if(esAlfabeto($alfabeto)){
                                        $correcto=1;
                                        print "-----------------------------------------------||\n";
                                        print "ARCHIVO ";
                                        if($en==1){print"ENCRIPTADO!\n\n";}else{print"DESENCRIPTADO!\n\n";}
                                        if(length($contenido)>0){
                                            if($en==1){
                                                say mono($contenido,$alfabeto);
                                            }else{
                                                say desMono($contenido,$alfabeto);
                                            }
                                        }else{
                                            my$archivoAux;my$nombreArchivoAux;
                                            if($en==1){
                                                $nombreArchivoAux=$nombreArchivo."ENCRIPTADO";
                                            }else{
                                                $nombreArchivoAux=$nombreArchivo."DESENCRIPTADO";
                                            }
                                            my$direccionAux=$ruta."/".$nombreArchivoAux.".txt";
                                            open($archivoAux,">$direccionAux");
                                            print$archivoAux "";
                                            close($archivoAux);
                                            open($archivoAux,">>$direccionAux");
                                            open($archivo,"<$direccion");
                                            while(<$archivo>){
                                                        chomp;
                                                    $contenido= $_;
                                                    my$encriptacion;
                                                    if($en==1){
                                                        $encriptacion=mono($contenido,$alfabeto);
                                                    }else{
                                                        $encriptacion=desMono($contenido,$alfabeto);
                                                    }
                                                    say$encriptacion;
                                                    print $archivoAux $encriptacion."\n";
                                            }
                                            close($archivo);
                                            close($archivoAux);
                                            print "\n-----------------------------------------------||\n";
                                        }
                                    }else{
                                        print"-------------------------------------------------\n";
                                        print "ALFABETO NO VALIDO\n";
                                        $correcto=0;
                                    }
                                }
                                $op=1;
                            }
                            default{
                                print "-----------------------------------------------||\n";
                                print "OPCION INCORRECTA";
                                $op=0;
                            }
                    }
                }
                $correcto=0;
                while($correcto==0){
                    print "\n1. Volver a ejecutar el programa\n";
                    print "0. SALIR\n";
                    print"SELECCIONE UNA OPCION: ";chomp($iniciar=<STDIN>);
                    given($iniciar){
                        when($_ eq "1"){
                            $iniciar=1;
                            $correcto=1;
                        }
                        when($_ eq "0"){
                            $iniciar=0;
                            $correcto=1;
                            print"\n////////////////////ADIOS//////////////////////\n";
                        }
                        default{
                            print "-----------------------------------------------||\n";
                            print"DATO INCORRECTO";
                            print "-----------------------------------------------||\n";
                            $correcto=0;
                        }
                    }
                }
    }else{
        print"\n//////////////////////ADIOS////////////////////////\n";
        $iniciar=0;
    }
}
#-----------------------------------------------FUNCIONES AUXILIARES------------------------------------------
sub esAlfabeto{
    my($alfabeto)=@_;
    my$n=length($alfabeto);my$cha;
    if($n!=27){
        return 1 eq 2;
    }
    for(my$i=1;$i<=$n;$i++){
        $cha=chop($alfabeto);
        if(ord($cha)<65||(ord($cha)>90&&ord($cha)<97)||ord($cha)>122){
            if(ord($cha)!=165&&ord($cha)!=164){
                return 1 eq 2;
            }
        }
    }
    return 1 eq 1;
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
#-----------------------------------------------NUMERO 1------------------------------------------
#-----------------------------------------------NUMERO 2------------------------------------------
#-----------------------------------------------NUMERO 3------------------------------------------
#-----------------------------------------------NUMERO 4------------------------------------------
#-----------------------------------------------NUMERO 5------------------------------------------
#-----------------------------------------------NUMERO 6------------------------------------------
#-----------------------------------------------NUMERO 7------------------------------------------
sub zigzag{
    my($texto,$altura)=@_;
    my$nuevoTexto="";
    if($altura==1){return $texto;}
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
}sub desZigzag{
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
    return $nuevoTexto;}
#-----------------------------------------------NUMERO 8------------------------------------------
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
}sub desMono{
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
    return $nuevoTexto;}
#-----------------------------------------------NUMERO 9------------------------------------------
#-------------------------------------------------------------------------------------------------