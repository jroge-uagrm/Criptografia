#Transposicion por Filas
use integer;
#Forma la nueva palabra con el caracter 
sub newPalabra{
	my($mensaje,$nfilas,$caracter)=@_;
	my $longitud= length($mensaje);
	my $ntotal=0;
	#para concatenar
	my $sub="";
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

sub Main{
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
				$i1=$i+1;
				if($i1%$nfilas==1){
					$newstring=$newstring.$names[$i];
				}		
			}
			$c=$c+1;
		}
	print $newstring;
}

#Para encriptar:
#$mensaje,$nfilas,$caracter
Main("ALEJANDRA",5,"X");
#Main("HOLACOMOESTAS",3,"X");

#Para desencriptar:
#$mensaje,$nfilas
#Main("HBTECOCERHLIQOOATUMWBAIUU",5);
#Main("ANLDERJAAX",2);
#Main("HAMSSOCOTXLOEAX",5);