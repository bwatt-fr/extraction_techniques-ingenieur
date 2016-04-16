#! usr/bin/perl

$sommaire="sommaire.html";
$baseurl="http://www.techniques-ingenieur.fr";
$urlPub="http://www.techniques-ingenieur.fr/res/notice/Encyclopedia/";
open(IN1,"SubThemesTest");
while(defined($line1=<IN1>)){
	chomp($line1);
	$urldownload=$line1.$sommaire;
	$urldownload=~/http:\/\/.*?\/.*?\/.*?\/(.*?)-ti.*/;
	$subthematique=$1;
	print "urldownload : $urldownload\n";
	`wget $urldownload`;
	open(IN2,"sommaire.html");
	while(defined($line2=<IN2>)){
		if($line2=~/<a href="(.*?)" rel="nofollow">(.*?)<\/a>/){
			$url=$baseurl.$1;
			$pub=$2;
			if($url=~/.*?documentaire\/(.*?)-th.*?\/(.*?)-\d.*?\/(.*?)-$pub\//){
				$thematique=$1;
				$subsubthematique=$2;
				$namePub=$3;
				`mkdir $thematique/$subthematique/$subsubthematique`;
				`wget $urlPub$pub --post-data="format=Txt&abstracts=true" -O $thematique/$subthematique/$subsubthematique/index`;
				open(INDEX,"$thematique/$subthematique/$subsubthematique/index");
				open(SORTIE,">$thematique/$subthematique/$subsubthematique/$namePub");
				while(defined($line3=<INDEX>)){
					print SORTIE $line3;
				}
				print SORTIE "adresse de téléchargement = \"$url\"\n";
				close(INDEX);
				close(SORTIE);
				`rm $thematique/$subthematique/$subsubthematique/index`;
				print "thematique : $thematique\n";
				print "sous-thematique : $subthematique\n";
				print "sous-sous-thematique : $subsubthematique\n";
				print "nom de la publication : $namePub\n";
				print "code de la publication : $pub\n";
				last;
			}
		}
	}
	`rm sommaire.html`;	
}

close(IN1,"SubThemesTest");
