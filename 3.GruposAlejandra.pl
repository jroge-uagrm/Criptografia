use integer;
#FAux para cifrar
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
		$i1=$i+1;
		if($i1%2==1){
			$newstring=$newstring.$names[$i];
		}
	}
	foreach my $i (0 .. $#names) {
		#say "$i - $names[$i]";
		$i1=$i+1;
		if($i1%2==0){
			$newstring=$newstring.$names[$i];
		}
	}
	return $newstring;
}

#FAux para descifrar

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


sub cifrarGrupos{
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
}


sub descifrarGrupos{
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
	return $auxcad;
}


#print cifrarGrupos("HOLACOMOESTAS",5);
print cifrarGrupos("MICIELOESAZULCOMOELMARAZUL",6);
#print descifrarGrupos("HLCOAO",6);

print descifrarGrupos("MCEIILOSZEAULOOCMELAAMRZUXXLXX",6);
#print descifrarGrupos("HLCOAOOSMETSXAX",5);