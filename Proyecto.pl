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
            when($_ eq "1"){
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
            when($_ eq "2"){
                print "\nIntroducir texto: ";chomp ($contenido=<STDIN>);
                $op=1;
            }
            when($_ eq "3"){
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
            when($_ eq "4"){
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
                                                say puro($contenido,$n);
                                            }else{
                                                say desPuro($contenido,$n);
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
                                                        $encriptacion=puro($contenido,$n);
                                                    }else{
                                                        $encriptacion=desPuro($contenido,$n);
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
                                                say puroPalabra($contenido,$palabraClave,$n);
                                            }else{
                                                say desPuroPalabra($contenido,$palabraClave,$n);
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
                                                        $encriptacion=puroPalabra($contenido,$palabraClave,$n);
                                                    }else{
                                                        $encriptacion=desPuroPalabra($contenido,$palabraClave,$n);
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
                                        print"-------------------------------------------------\n";
                                        $correcto=0;
                                    }
                                }
                            }
                            when($_ eq "3"){
                                $op=1;
                                $correcto=0;
                                while($correcto==0){
                                    print "-----------------------------------------------||\n";
                                    print "3. TRANSPOSICION POR GRUPOS\n";
                                    print "Introduzca el grupo: ";chomp($palabraClave=<STDIN>);
                                    if(esPalabra($palabraClave)){
                                        $correcto=1;
                                        print "-----------------------------------------------||\n";
                                        print "ARCHIVO ";
                                        if($en==1){print"ENCRIPTADO!\n\n";}else{print"DESENCRIPTADO!\n\n";}
                                        if(length($contenido)>0){
                                            if($en==1){
                                                say grupos($contenido,$palabraClave);
                                            }else{
                                                say desGrupos($contenido,$palabraClave);
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
                                                        $encriptacion=grupos($contenido,$palabraClave,$n);
                                                    }else{
                                                        $encriptacion=desGrupos($contenido,$palabraClave,$n);
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
                                        print"-------------------------------------------------\n";
                                        $correcto=0;
                                    }
                                }  
                            }
                            when($_ eq "4"){
                                $op=1;
                                while($correcto==0){
                                    print "-----------------------------------------------||\n";
                                    print "4. TRANSPOSICION POR SERIES\n";
                                        print "-----------------------------------------------||\n";
                                        print "ARCHIVO ";
                                        if($en==1){print"ENCRIPTADO!\n\n";}else{print"DESENCRIPTADO!\n\n";}
                                        if(length($contenido)>0){
                                            if($en==1){
                                                say serie($contenido,$n);
                                            }else{
                                                say desSerie($contenido,$n);
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
                                                        $encriptacion=serie($contenido,$n);
                                                    }else{
                                                        $encriptacion=desSerie($contenido,$n);
                                                    }
                                                    say$encriptacion;
                                                    print $archivoAux $encriptacion."\n";
                                            }
                                            close($archivo);
                                            close($archivoAux);
                                            print "-----------------------------------------------||\n";
                                        }
                                        $correcto=1;
                                }
                            }
                            when($_ eq "5"){
                                $op=1;
                                while($correcto==0){
                                    print "-----------------------------------------------||\n";
                                    print "5. TRANSPOSICION POR COLUMNAS\n";
                                    print "Introduzca la cantidad de desplazamientos: ";chomp($n=<STDIN>);
                                    if(esNumero($n)){
                                        $correcto=1;
                                        print "-----------------------------------------------||\n";
                                        print "ARCHIVO ";
                                        if($en==1){print"ENCRIPTADO!\n\n";}else{print"DESENCRIPTADO!\n\n";}
                                        if(length($contenido)>0){
                                            if($en==1){
                                                say columnas($contenido,$n);
                                            }else{
                                                say desColumnas($contenido,$n);
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
                                                        $encriptacion=columnas($contenido,$n);
                                                    }else{
                                                        $encriptacion=desColumnas($contenido,$n);
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
                            when($_ eq "6"){
                                $op=1;
                                while($correcto==0){
                                    print "-----------------------------------------------||\n";
                                    print "6. TRANSPOSICION POR FILAS\n";
                                    print "Introduzca el caracter clave: ";chomp($palabraClave=<STDIN>);
                                    if(esPalabra($palabraClave)){
                                        $correcto=1;
                                    }else{
                                        print"-------------------------------------------------\n";
                                        print "CARACTER NO VALIDO\n";
                                        $correcto=0;
                                    }
                                }
                                $correcto=0;
                                while($correcto==0){
                                    print "\nIntroduzca n: ";chomp($n=<STDIN>);
                                    if(esNumero($n)){
                                        $correcto=1;
                                        print "-----------------------------------------------||\n";
                                        print "ARCHIVO ";
                                        if($en==1){print"ENCRIPTADO!\n\n";}else{print"DESENCRIPTADO!\n\n";}
                                        if(length($contenido)>0){
                                            if($en==1){
                                                say filas($contenido,$n,$palabraClave);
                                            }else{
                                                say desFilas($contenido,$n,$palabraClave);
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
                                                        $encriptacion=filas($contenido,$n,$palabraClave);
                                                    }else{
                                                        $encriptacion=desFilas($contenido,$n,$palabraClave);
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
                            when($_ eq "9"){
                                $op=1;
                                while($correcto==0){
                                    print "-----------------------------------------------||\n";
                                    print "9. SUSTITUCION POLIALFABETICA\n";
                                    print "Introduzca la palabra clave: ";chomp($palabraClave=<STDIN>);
                                    if(esPalabra($palabraClave)){
                                        $correcto=1;
                                        print "-----------------------------------------------||\n";
                                        print "ARCHIVO ";
                                        if($en==1){print"ENCRIPTADO!\n\n";}else{print"DESENCRIPTADO!\n\n";}
                                        if(length($contenido)>0){
                                            if($en==1){
                                                say poli($contenido,$palabraClave);
                                            }else{
                                                say desPoli($contenido,$palabraClave);
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
                                                        $encriptacion=poli($contenido,$palabraClave);
                                                    }else{
                                                        $encriptacion=desPoli($contenido,$palabraClave);
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
                                        print"-------------------------------------------------\n";
                                        $correcto=0;
                                    }
                            }}
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
sub esNumero(){
    my($alfabeto)=@_;
    my$n=length($alfabeto);my$cha;
    for(my$i=1;$i<=$n;$i++){
        $cha=chop($alfabeto);
        if(ord($cha)<48||ord($cha)>57){
            return 1 eq 2;
        }
    }
    return 1 eq 1;
}
sub esPalabra(){
    my($alfabeto)=@_;
    my$n=length($alfabeto);my$cha;
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
sub InvertirTexto{
    my ($textoAInvertir)=@_;
    my $cantidad=length($textoAInvertir);
    my $textoInvertido="";
    for (my $i=1;$i<=$cantidad;$i++){
        $textoInvertido=$textoInvertido.chop($textoAInvertir);
    }
    return $textoInvertido;
}
sub newPalabra{
	my($mensaje,$nfilas,$caracter)=@_;
	my $longitud= length($mensaje);
	my $ntotal=0;
	#para concatenar
	my $sub="";
    my$substring="";
	my $new="";
	my $sw=0;
	if($longitud>9){
		my $div= $longitud / $nfilas;
		if($div!=$nfilas){
			$div=$div+1;
		}
		my $total= $div * $nfilas;
		$ntotal= $total-$longitud;
	}
	if($longitud <$nfilas){
		$ntotal=$nfilas-$longitud;
	}
	
	if( $longitud>$nfilas && $longitud<10){
		my $modulo= $longitud%$nfilas;
		if($modulo==0){
			$sw=1;
		}else{
			$ntotal= $nfilas-$modulo;
		}
	}

	#generando la cadena para concatenar
	
	if($ntotal!=0){
		my $ntotalaux=$ntotal;
		while($ntotalaux!=0){
			$substring=$substring.$caracter;
			$ntotalaux=$ntotalaux-1;
		}
	}
	if($sw==1 || $ntotal==0){
		$new=$mensaje;
	}else{
		$new=$mensaje.$substring;
	}
	#my $news=length($new);
}
sub separa{
    my ($mensaje)=@_;
    #my $mensaje="HOLACOMOESTAS";
    #my $mensaje="HOLACO";
    #my $mensaje="ANALUCIA";
    #my $mensaje="ALEJANDRA";
    my $newstring="";
	my @names= split("",$mensaje);
	foreach my $i (0 .. $#names) {
		#say "$i - $names[$i]";
		my$i1=$i+1;
		if($i1%2==1){
			$newstring=$newstring.$names[$i];
		}
	}
	foreach my $i (0 .. $#names) {
		#say "$i - $names[$i]";
		my$i1=$i+1;
		if($i1%2==0){
			$newstring=$newstring.$names[$i];
		}
	}
	return $newstring;
}
sub interc{
	my ($mensaje)=@_;
	my $longitud= length($mensaje);
	my $par="";
	my $impar="";
	my $newstring="";
	my $nueva_cadena="";

		if($longitud%2==0){ #es par
			my $longitud2= $longitud/2;
			$impar=substr($mensaje,0,$longitud2);
			$par= substr($mensaje,$longitud2,$longitud);
			while($longitud2!=0){
				my $char= chop($impar);
				my $char2= chop($par);
				$nueva_cadena=$nueva_cadena.$char2.$char;
				$longitud2=$longitud2-1;
			}
		}else{ #es impar
			my $longitudn= $longitud/2;
			my $longitud2= $longitudn+1;
			$impar=substr($mensaje,0,$longitud2);
			$par= substr($mensaje,$longitud2,$longitud);
			while($longitudn!=0){
				my $char= chop($impar);
				my $char2= chop($par);
				$nueva_cadena=$nueva_cadena.$char.$char2;
				$longitudn=$longitudn-1;
			}
			$nueva_cadena=$nueva_cadena.$impar;
		}	
		my $newlength= length($nueva_cadena);
			while ($newlength!=0){
				my $char3= chop($nueva_cadena);
				$newstring=$newstring.$char3;
				$newlength=$newlength-1;
			}
	return $newstring;
}
sub generarAlfabeto{
	my($desplazamiento)=@_;
	my $alfabeto="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	my $cantEle=length($alfabeto);
	my $previa2="";
    my $previa="";
    my $alfabetoG="";
	if ($desplazamiento<=$cantEle){
		$previa=substr($alfabeto,$desplazamiento,$cantEle);
		$previa2=substr($alfabeto,0,$desplazamiento);
	}else{
		my $nuevapos= $desplazamiento % $cantEle;
		$previa=substr($alfabeto,$nuevapos+1,$cantEle);
		$previa2=substr($alfabeto,0,$nuevapos+1);
	}
	$alfabetoG= $alfabetoG.$previa."".$previa2;
	return $alfabetoG;
}
sub generarAlfConPalD{
	my ($palabra,$desplazamiento)=@_;
	#
	my @arreglo= split("",$palabra);
	my @nuevo_array=();
	my @visto_antes=@arreglo;
	foreach  my $caracter ( @arreglo ) {
		#push @nuevo_array, $caracter if not $visto_antes{$caracter}++;
	}
	my $string = join("",@nuevo_array);
	#
	my $newpalabra=$string;

	my $alfabetoD=generarAlfabeto($desplazamiento);
	my $newpalabra1="";
	
	#concatenamos
	$newpalabra1=$newpalabra.$alfabetoD;
	
	#eliminamos repetidos
		#
	my @arreglo1= split("",$newpalabra1);
	my @nuevo_array1=();
	my @visto_antes1=@arreglo1;
	foreach  my $caracter1 ( @arreglo1 ) {
		#push @nuevo_array1, $caracter1 if not $visto_antes1{$caracter1}++;
	}
	my $string1 = join("",@nuevo_array1);
	#
	my $nuevo_alf=$string1;
	return $nuevo_alf;
}
#-----------------------------------------------NUMERO 1------------------------------------------
sub puro{
    my ($texto,$desplazar)=@_;
    my $cantidadLetras=length($texto);
    my $nuevoTexto="";
    for (my $i=1;$i<=$cantidadLetras;$i++){
        my $char=chop($texto);
        my $valorAscii=ord($char);
        if ($valorAscii<=90 && $valorAscii>=65){
            $valorAscii=(($valorAscii-65+$desplazar)% 26)+65;
        }
        if ($valorAscii<=122 && $valorAscii>=97){
            $valorAscii=(($valorAscii-97+$desplazar)% 26)+97;
        }
        $nuevoTexto=chr($valorAscii).$nuevoTexto;
    }
    $nuevoTexto;
}sub desPuro{
    my($texto,$desplazar)=@_;
    my $cantidadLetras=length($texto);
    my $nuevoTexto="";
    for (my $i=1;$i<=$cantidadLetras;$i++){
        my $char=chop($texto);
        my $valorAscii=ord($char);
        if ($valorAscii<=90 && $valorAscii>=65){
            $valorAscii=(($valorAscii-65-$desplazar)% 26)+65;
        }
        if ($valorAscii<=122 && $valorAscii>=97){
            $valorAscii=(($valorAscii-97-$desplazar)% 26)+97;
        }
        $nuevoTexto=chr($valorAscii).$nuevoTexto;
    }
    $nuevoTexto;}
#-----------------------------------------------NUMERO 2------------------------------------------
sub puroPalabra{
	my ($mensaje,$palabra,$desplazamiento)=@_;
	#utilizando el split para separar letra por letra 
	my @names= split("",$mensaje);
	my $alfabeto="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	my @alfb= split("",$alfabeto);
	my $NAlfA =generarAlfConPalD($palabra,$desplazamiento);
	my @NAlf= split("",$NAlfA);
	my $newcad="";
	
	#cifrar
		foreach my $i (0 .. $#names) {
		  foreach my $j(0 .. $#NAlf){
			if($names[$i]eq $NAlf[$j]){
				$newcad=$newcad.$alfb[$j];
			}
		  }
		}

	return $newcad;
}sub desPuroPalabra{
	my ($mensaje,$palabra,$desplazamiento)=@_;
	#utilizando el split para separar letra por letra 
	my @names= split("",$mensaje);
	my $alfabeto="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	my @alfb= split("",$alfabeto);
	my $NAlfA =generarAlfConPalD($palabra,$desplazamiento);
	my @NAlf= split("",$NAlfA);
	my $newcad="";
	
	#descifrar
		foreach my $i (0 .. $#names) {
		  foreach my $j(0 .. $#alfb){
			if($names[$i]eq $alfb[$j]){
				$newcad=$newcad.$NAlf[$j];
			}
		  }
		}
	
	return $newcad;}
#-----------------------------------------------NUMERO 3------------------------------------------
sub grupos{
	my ($mensaje,$ngrupos)=@_;
	my $longitud=length($mensaje);
	my $mod=$longitud%$ngrupos;
	my $new=$mensaje;
	my $newstring="";
	my $auxcad="";
	my $subcads1="";
		if($mod!=0){
			my $substring="";
			my $caracter="X";
			my $ntotalaux=$ngrupos-$mod;
			while($ntotalaux!=0){
				$substring=$substring.$caracter;
				$ntotalaux=$ntotalaux-1;
			}
			$new=$mensaje.$substring;
			$longitud=length($new);
		}
		my $c=0;
		my $contador=$longitud/$ngrupos;
		my $subcads="";
		while($contador!=0){
			if($c==0){
				$subcads=substr($new,0,$ngrupos);
				$subcads1=separa($subcads);
			}else{
				my $ult= $ngrupos;
				$subcads=substr($new,$c,$ult);
				$subcads1=separa($subcads);
			}
			$auxcad=$auxcad.$subcads1." ";
			$c=$c+$ngrupos;
			$contador=$contador-1;
		}
	return $auxcad;
}sub desGrupos{
	my ($mensaje,$ngrupos)=@_;
	#my $mensaje="HOLACOMOESTAS";
	#my $mensaje="ANALUCIA";
	#my $mensaje="ALEJANDRA";
	#my $mensaje="MICIELOESAZULCOMOELMARAZUL";
	my $longitud=length($mensaje);
	#my $ngrupos=2;
	my $mod=$longitud%$ngrupos;
	my $new=$mensaje;
	my $newstring="";
	my $auxcad="";
	my $subcads1="";
	
		my $c=0;
		my $contador=$longitud/$ngrupos;
		my $subcads="";
		while($contador!=0){
			if($c==0){
				$subcads=substr($new,0,$ngrupos);
				$subcads1=interc($subcads);
			}else{
				my $ult= $ngrupos;
				$subcads=substr($new,$c,$ult);
				$subcads1=interc($subcads);
			}
			$auxcad=$auxcad.$subcads1;
			$c=$c+$ngrupos;
			$contador=$contador-1;
		}
	return $auxcad;}
#-----------------------------------------------NUMERO 4------------------------------------------
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
}sub desSerie{
    my($texto)=@_;
    my$textoA="";my$textoB="";
    my$cha="";
    if(mod(length($texto),2)==1){
        $cha=chop($texto);
    }
    my$n=length($texto);my$nuevoTexto="";
    for(my$i=1;$i<=divi($n,2);$i++){
        $textoB=chop($texto).$textoB;
    }
    for(my$i=1;$i<=divi($n,2);$i++){
        $nuevoTexto=chop($texto).$nuevoTexto;
        $nuevoTexto=chop($textoB).$nuevoTexto;
    }
    $nuevoTexto=$nuevoTexto.$cha;
    return $nuevoTexto;}

#-----------------------------------------------NUMERO 5------------------------------------------
sub columnas{
    my ($texto,$desplazar)=@_;
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
}sub desColumnas{
    my ($texto,$desplazar)=@_;
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
    $nuevoTexto;}
#-----------------------------------------------NUMERO 6------------------------------------------
sub filas{
	my($mensaje1,$nfilas,$caracter)=@_;
	my $c=0;
	my $newstring="";
	my $mensaje= newPalabra($mensaje1,$nfilas,$caracter);
	my $longitud= length($mensaje);
		while($c!=$nfilas){
			my $newmensaje=$mensaje;
			if($c!=0){
				$newmensaje=substr($mensaje,$c,$longitud);
			}	
			my @names= split("",$newmensaje);
			foreach my$i (0 .. $#names) {
				my$i1=$i+1;
				if($i1%$nfilas==1){
					$newstring=$newstring.$names[$i];
				}		
			}
			$c=$c+1;
		}
	return $newstring;
}sub desFilas{
	my($mensaje1,$nfilas,$caracter)=@_;
	my $c=0;
	my $newstring="";
	my $mensaje= newPalabra($mensaje1,$nfilas,$caracter);
	my $longitud= length($mensaje);
		while($c!=$nfilas){
			my $newmensaje=$mensaje;
			if($c!=0){
				$newmensaje=substr($mensaje,$c,$longitud);
			}	
			my @names= split("",$newmensaje);
			foreach my $i (0 .. $#names) {
				my$i1=$i+1;
				if($i1%$nfilas==1){
					$newstring=$newstring.$names[$i];
				}		
			}
			$c=$c+1;
		}
	print $newstring;}
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
    my$exc=0;
    if(length($texto)+$altura-2>divi($n+$salto-1,$salto)){
        $exc=(divi($n+$salto-1,$salto)+1)*$salto-$salto+1-length($texto);
        push@palabras,"";
    }
    my$k=0;my$indice;
    while($k<$altura-2){
        my$divS=divi($n+$k,$salto);
        my$divO=divi($n-$k-2,$salto)+1;
        my$bulean=1;$indice=0;my$vari=1;my$indice2;
        if($exc==0){
            $indice2=$canPal;
        }else{
            $indice2=$canPal+1;
        }
        if($divO==$divS){$bulean=0;$indice=1;$indice2=$canPal;}
        for(my$i=1;$i<=$divS+$divO;$i++){
            if($vari>=$exc && $i==1){
                my$conte=$palabras[$canPal];
                $conte=chop($texto).$conte;
                $palabras[$indice2]=$conte;
            }
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
        }$vari++;
        $k++;
    }
    if($exc==0){
        $indice=$canPal;
    }else{
        $indice=$canPal+1;
    }
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
sub poli{
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
}sub desPoli{
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
    $nuevoTexto;}
#-------------------------------------------------------------------------------------------------