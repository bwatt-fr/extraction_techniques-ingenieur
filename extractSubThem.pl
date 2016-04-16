#! usr/bin/perl
#

$url="http://www.techniques-ingenieur.fr";

open(IN,"Themes");
open(OUT,">SubThemes");

while(defined($line=<IN>)){
	`wget $line`;
	$line=~/.*(\/base.*)/;
	$url1=$1;
	open(IN1,"index.html");
	while(defined($line2=<IN1>)){
		if($line2=~/$url1(.*?)" title/){
			if(!($1 eq "")){
				print OUT "$url$url1$1\n";
				$var=$url.$url1.$1;
				$var=~/(.*)?documentaire\/(.*?)-th.*?\/(.*)?-ti.*/;
				`mkdir $2/$3`;
			}
		}
		
	}
	`rm index.html`;
	close(IN1);
}
close(IN);
close(OUT);
