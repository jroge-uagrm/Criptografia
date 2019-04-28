#!C:\xampp\perl\bin
use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";

print "\n PROYECTO#1 DE CRIPTOGRAFIA Y SEGURIDAD";
my $op;my$n;my$correcto;
my$ruta;my$nombreArchivo;my$direccion;my$contenido;my$palabraClave,my$archivo;
$op=0;
while($op==0){
    print "\n\nMENU: \n";
    print "1. Abrir un archivo para encriptar\n";
    print "2. Ingresar texto para encriptar\n";
    print "0. Salir\n";
    print "selecciona una opcion : ";
    $correcto=0;
    chomp ($op=<STDIN>);
    given($op){
        when($_ eq "1"){
            while($correcto==0){
                print "Ruta de la carpeta del archivo : ";
                chomp ($ruta=<STDIN>);
                print "Nombre del archivo : ";
                chomp ($nombreArchivo=<STDIN>);
                $direccion=$ruta."/".$nombreArchivo.".txt";
                if(open($archivo,"<$direccion")){
                    print "\nARCHIVO:\n";
                    while(<$archivo>){
                                chomp;
                            $contenido= $_;
                            say $contenido;
                            }
                    $correcto=1;
                }else{
                    print "\nARCHIVO NO EXISTE\n\n";
                    $correcto=0;
                }
            }
            $op=0;
            while($op==0){
                print "\n\nSELECCIONE EL METODO DE ENCRIPTACION :\n";
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
                    when($_==1){
                            print "\n1. DESLIZAMIENTO PURO \n";
                            while($correcto==0){
                                print "\nIntroduzca la cantidad de desplazamientos: ";
                                chomp($n=<STDIN>);
                                given($n){
                                    when(esNumero($_)){
                                        $correcto=1;
                                        #NUMERO 1
                                    }default{
                                        print "DATO INCORRECTO\n";
                                    }
                                }
                            }
                        }when($_==2){
                            print "\nIntroduzca la palabra clave :";
                            chomp($palabraClave=<STDIN>);
                            while($correcto==0){
                                if(esPalabra($palabraClave)){
                                    $correcto=1;
                                }else{
                                    print "\nPALABRA NO VALIDA";
                                }
                            }
                            $correcto=0;
                            while($correcto==0){
                                print "\nIntroduzca la cantidad de desplazamiento :";
                                chomp($n=<STDIN>);
                                given($n){
                                    when($_ > 0){
                                        $correcto=1;
                                        #NUMERO 2
                                    }default{
                                        print "DATO INCORRECTO";
                                    }
                                }
                            }
                        }
                        default{
                            while(<$archivo>){
                                chomp;
                            $contenido= $_;
                            say $contenido;
                            }
                        }
                    }
                    close($archivo);
                    print "\n\n1. Reiniciar programa\n";
                print "0. Salir\n";
                print "selecciona una opcion : ";
                chomp ($op=<STDIN>);
        }
        when($_ eq "2"){
            print "\nIntroducir texto plano :";
            $contenido
        }
        when($_ eq "0"){
            print "\nADIOS\n";
            $op=1;
        }default{
            print "\nOPCION INCORRECTA\n\n";
            $op=0;
        }
    }
}
sub esNumero(){
    my($x)=@
}





















