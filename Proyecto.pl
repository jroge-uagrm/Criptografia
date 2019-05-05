#!C:\xampp\perl\bin
use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";

print "\n PROYECTO#1 DE CRIPTOGRAFIA Y SEGURIDAD";
my $op;my$n;my$correcto;
my$ruta;my$nombreArchivo;my$direccion;my$contenido;my$palabraClave;my$archivo;my$iniciar;
$iniciar=0;
while($iniciar==0){
    $op=0;
    while($op==0){
        print "\n\nMENU: \n";
        print "1. Abrir un archivo para encriptar\n";
        print "2. Ingresar texto para encriptar\n";
        print "3. Abrir un archivo para desencriptar\n";
        print "4. Ingresar texto para desencriptar\n";
        print "0. Salir\n";
        print "selecciona una opcion : ";
        $correcto=0;
        chomp ($op=<STDIN>);
        given($op){
            when($_ eq "1"){                                        #USUARIO ELIGE INTRODUCIR LA DIRECCION DEL ARCHIVO
                while($correcto==0){
                    print "\nRuta de la carpeta del archivo : ";
                    chomp ($ruta=<STDIN>);
                    print "\nNombre del archivo : ";
                    chomp ($nombreArchivo=<STDIN>);
                    $direccion=$ruta."/".$nombreArchivo.".txt";
                    if(open($archivo,"<$direccion")){
                        print "\nARCHIVO:\n\n";
                        while(<$archivo>){
                                    chomp;
                                $contenido= $_;
                                say $contenido;
                        }
                        close($archivo);
                        $correcto=1;
                    }else{
                        print "\nARCHIVO NO EXISTE\n\n";
                        $correcto=0;
                    }
                }
                $op=1;
            }
            when($_ eq "2"){                                           #USUARIO ELIGE INGRESAR EL TEXTO _________________
                print "\nIntroducir texto: ";
                chomp ($contenido=<STDIN>);
                $op=1;
            }
            when($_ eq "0"){
                print "\nADIOS\n";
                $op=3;
            }
            default{
                print "\nOPCION INCORRECTA\n\n";
                $op=0;
            }
        }
    }
    if($op == 1){
        $op=0;
                while($op==0){
                    print "\n\nSELECCIONE EL METODO DE ENCRIPTACION: \n";
                    print "1. Deslizamiento puro\n";
                    print "2. Deslizamiento puro con palabra clave\n";
                    print "3. Transposicion por grupos\n";
                    print "4. Transposicion por series\n";
                    print "5. Transposicion por columnas\n";
                    print "6. Transposicion por filas\n";
                    print "7. Transposicion por zigzag\n";
                    print "8. Sustitucion mono alfabetica\n";
                    print "9. Sustitucion poli alfabetica\n";
                    print "\nselecciona una opcion : ";
                    chomp ($op=<STDIN>);
                    $correcto=0;
                    given($op){
                            when($_==1){                                            #DESLIZAMIENTO PURO
                                print "\n1. DESLIZAMIENTO PURO \n";
                                while($correcto==0){
                                    print "\nIntroduzca la cantidad de desplazamientos: ";
                                    chomp($n=<STDIN>);
                                    if(esValido($n)){
                                        $correcto=1;
                                        #NUMERO 1
                                    }else{
                                        print "DATO INCORRECTO\n";
                                        $correcto=0;
                                    }
                                }
                            }
                            when($_==2){                                       #DESLIZAMIENTO PURO CON PALABRA CLAVE
                                print "\nIntroduzca la palabra clave: ";
                                chomp($palabraClave=<STDIN>);
                                while($correcto==0){
                                    if(esPalabra($palabraClave)){
                                        $correcto=1;
                                    }else{
                                        print "\nPALABRA NO VALIDA";
                                        $correcto=0;
                                    }
                                }
                                $correcto=0;
                                while($correcto==0){
                                    print "\nIntroduzca la cantidad de desplazamientos: ";
                                    chomp($n=<STDIN>);
                                    if(esValido($n)){
                                        $correcto=1;
                                        #NUMERO 2
                                    }else{
                                        print "DATO INCORRECTO\n";
                                        $correcto=0;
                                    }
                                }
                            }
                            when($_==8){           
                                my$alfabeto;                            #SUSTITUCION MONOALFABETICA
                                print "\nIntroduzca su alfabeto: ";
                                chomp($alfabeto=<STDIN>);
                                while($correcto==0){
                                    if(esAlfabeto($alfabeto)){
                                        $correcto=1;
                                    }else{
                                        print "\nALFABETO INCORRECTO";
                                        $correcto=0;
                                    }
                                }
                                say Mono($contenido,$alfabeto);
                            }
                            default{
                                print "\nOPCION INCORRECTA\n\n";
                                $op=0;
                            }
                    }
                }
                print "\nENCRIPTADO!\n";
    }
    print "1. Volver a ejecutar el programa";
    print "0. SALIR";
    chomp($iniciar=<STDIN>);
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
#-----------------------------------------------NUMERO 9------------------------------------------
