#!/usr/local/bin/perl
use strict;
use warnings;


my $directory = "./";
#modify directory to the current directory where all the files are located.
opendir(DIR, $directory);
foreach my $file (readdir(DIR))
{
#next unless ($file =~ m/\.phy$/);
next unless ($file =~ m/\.pal$/);
	{
`cp codeml.ctl codeml.ctl2`;
`cp codeml.ctl "codeml"$file`;
`perl -pi -e 's/seqfile\ =\ /seqfile\ = $file/' "codeml"$file`;
`perl -pi -e 's/outfile\ =\ /outfile\ = $file.output.txt/' "codeml"$file`;
`mv "codeml"$file codeml.ctl`;
`./codeml`;
`mv codeml.ctl2 codeml.ctl`;
	}
}

`rm rub rst1 rst lnf 2NG.t 2NG.dS 2NG.dN 4fold.nuc`;
`mkdir Outputfiles`;
`mv *.output.txt ./Outputfiles/`;

closedir(DIR);

exit;
