#!C:\xampp\perl\bin
#use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";
use feature qw( switch );
no if $] >= 5.018, warnings => qw( experimental::smartmatch );
print"\n-------------------------------------------------\n";
print"PROYECTO#1 DE CRIPTOGRAFIA Y SEGURIDAD         ||";
my$cha="ñ";
say(ord($cha));
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
                                        if(length($contenido)>0){
                                            #NUMERO 1
                                        }else{
                                            open($archivo,"<$direccion");
                                            while(<$archivo>){
                                                        chomp;
                                                    $contenido= $_;
                                                    #NUMERO 1  say$contenido
                                            }
                                            close($archivo);
                                            $correcto=1;
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
                                        if(length($contenido)>0){
                                            #NUMERO 2
                                        }else{
                                            open($archivo,"<$direccion");
                                            while(<$archivo>){
                                                        chomp;
                                                    $contenido= $_;
                                                    #NUMERO 2  say$contenido
                                            }
                                            close($archivo);
                                        }
                                    }else{
                                        print"-------------------------------------------------\n";
                                        print "DATO INCORRECTO\n";
                                        print"-------------------------------------------------\n";
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
                                        if(length($contenido)>0){
                                            say Mono($contenido,$alfabeto);
                                        }else{
                                            open($archivo,"<$direccion");
                                            while(<$archivo>){
                                                        chomp;
                                                    $contenido= $_;
                                                    say Mono($contenido,$alfabeto);
                                            }
                                            close($archivo);
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
                print "-----------------------------------------------||\n";
                print "\nENCRIPTADO!\n\n";
                print "-----------------------------------------------||\n";
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
    return 1 eq 1;
}
#-----------------------------------------------NUMERO 1------------------------------------------
#-----------------------------------------------NUMERO 2------------------------------------------
#-----------------------------------------------NUMERO 3------------------------------------------
#-----------------------------------------------NUMERO 4------------------------------------------
#-----------------------------------------------NUMERO 5------------------------------------------
#-----------------------------------------------NUMERO 6------------------------------------------
#-----------------------------------------------NUMERO 7------------------------------------------
#-----------------------------------------------NUMERO 8------------------------------------------
sub Mono{
    my ($texto,$nuevoAlfabeto)=@_;
    my$nuevoTexto;
    my$n=length($texto);
    if($n==0){
        $nuevoTexto="";
    }else{
        my$cha=chop($texto);
        $nuevoTexto=Mono($texto,$nuevoAlfabeto);
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
#-----------------------------------------------NUMERO 9------------------------------------------
