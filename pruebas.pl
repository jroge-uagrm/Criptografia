#!C:\xampp\perl\bin
use warnings;
use strict;
use utf8;
use 5.010;#Para say
use feature "switch";

my @arreglo=("uno","dos","tres");
my $c = 1;
while($c!=0){
    # say $c;
    $c=0;
}
foreach my$for(@arreglo){
    # say $for
}for(my $i=1;$i<=2;$i++){
    my $elemento=$arreglo[$i];
    # say $elemento;
}#Si se usan numero negativos como indice, 
#se va a ir al ultimo elemento y empezsara a descontar
#Si se usan comillas simples se muestra LITERALMENTE
#Si no no
my $len = $#arreglo +1;#Para la longitud
my $len2 = scalar @arreglo;#Tambien sirve sin SCALAR
# say $len2;

push @arreglo,"cuatro";#Añade al final
# say @arreglo;
unshift @arreglo,"cero";#Añade al inicio
#say @arreglo;
my $ultimo=pop @arreglo;#Saca el ultimo shift saca el primero
# say $ultimo;
# say @arreglo;
my $numero=1;
# given($numero){
#     when($_ == 1){# o eq
#         # say "Numero 1";
#         continue;#Para seguir preguntando
#     }
# }
#my $cadena = "1234";
# say "La longitud es : ".length $cadena;
# my $char="7";
# say "La POS es : ".index $cadena,$char;#rindex para buscar alverez
# my $subs=substr $cadena ,3,2;
# say $subs;
sub nombreApellido{
    my($n,$a)=@_;
    print $n." ".$a."\n";
}
#Subrutina, para devolver algo solo hay que retornar
#nombreApellido("Jroge","Torrez");
sub masUno{
    my($n)=@_;
    $n=$n+1;
    my $x=4;
}
#Si no pongo return y estoy esperando un resultado, 
#devolverá al valor de la ultima variable con la que trabajé
# my $n=masUno(1);
# say $n;
#<leer >sobreescribir >>añadir
# open(my $archivo,'>>c:/encriptaciones/a.txt')||die"ARCHIVO NO EXISTE\n";
# print $archivo "Ejemplo";
# # close($archivo);
# my $nombre;
# chomp($nombre=<STDIN>);
# #chomp es para eliminar el ultimo caracter que instroduzco
# #Es decir el enter
# say $nombre;
print chr(65);#Muestra el el caracter 65