#/ usr/bin/perl

$url="http://www.techniques-ingenieur.fr/";
$url2="ressources-documentaires/";
`wget $url$url2`;

open(IN,"index.html");
open(OUT,">Themes");
while(defined($line=<IN>)){
	if($line=~/<a\sclass="51.*href="\/(.*)?">(.*)?<\/a>/){
		print OUT "$url$1\n";
		$var=$1;
		$var=~/(.*)?documentaire\/(.*?)-th/;
		print "$2\n";
		`mkdir -p $2`;
	}
}
`rm index.html`; 
close(IN);
close(OUT);
