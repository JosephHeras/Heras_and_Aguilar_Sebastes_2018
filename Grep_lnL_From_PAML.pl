#!/usr/bin/perl

use strict;
use warnings;

my $directory = "./"; # i think says $directory is the one you are in
opendir (DIR, $directory); #opens the directory
foreach my $file (readdir(DIR)) #reads each file from $directory into $file
{

	next unless ($file =~ m/\.txt$/); #goes through each file and looks for ones that end with .txt  looks at each file iteratively
	{
		`grep "CODONML" $file >> output.out`; #runs this command line.
		`grep "After" $file >> output.out`; # runs this on command line.
        #`grep lnL output.out | tr -s " " | cut -d " " -f5 > out.txt`;
	}
}


closedir (DIR);
