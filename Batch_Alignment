#!/usr/bin/perl

use strict;
use warnings;

`mkdir muscle`;
`mkdir paml`;
my $directory = "./";
opendir (DIR, $directory);
foreach my $file (readdir(DIR))
{

	next unless ($file =~ m/\.txt$/);
	{
		`mkdir $file"_01"`;
		open(my $filehandle, '<', $file) or die "Could not open $file\n";

		while (my $line = <$filehandle>)
		{
        		chomp($line);
			open (TEMP, ">temp.fas");
			print TEMP "$line";
			`fastacmd -d nuc.fas -i temp.fas > $line.cds`;		
			`fastacmd -d pep.fas -i temp.fas > $line.pep`;
		}
		`cat *.cds > $file".cds"`;
		`cat *.pep > $file".pep"`;
		`rm JH*`;
		`./muscle3.8.31 -in $file.pep -out muscle.$file.mus`;
   		#`clustalw -INFILE=$file.pep -TYPE=PROTEIN -OUTPUT=FASTA -OUTFILE=$file.aln`;
		`perl pal2nal.pl muscle.$file.mus $file.cds -output fasta > pal2nal.$file.pal`;
		`mv *.cds ./$file"_01"/`;
		`mv *.pep ./$file"_01"/`;
		`mv *.mus ./muscle/`;
		`mv *.pal ./paml/`;

	}
}


closedir (DIR);
close (TEMP);




perl pal2nal.pl muscle.$file.mus $file.cds -output fasta > pal2nal.$file.pal
