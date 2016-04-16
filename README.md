# Goal

This scripts were written to download all the publications of the website techiques de l'ingenieur.
A friend needed all the publications in order to study the keywords they had in common. Althouth the publications are freely downloadables,
it was impossible to download all of them. My friend asked me to write a script to download them all.

# Language

I use Perl, because I was learning it, and wanted to train. It's not the moste efficient way to do scrapping (python, for example, is better), but it was fun !

# Usage

You need to be on Linux to use it.
The first script, extractThem.pl, write all the thems on a file, and create a directory by theme.
The second script, extractSubThem.pl, do the same things for the sub-thems.
Finally, extractPublications.pl download the publications and place them in the good directory (them/subthem).

Note : these scripts are old (November 2013), so they don't work anymore because the structure of the websites change.
So you need to change the regexp in the diffente scipts if you want to use it.
