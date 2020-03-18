#!/usr/bin/perl
# this script processes dracula.txt and finds the word count
use strict;
use warnings;
use Data::Dumper;

my %collection;

my $vocab = $ARGV[0];
open my $fh, '<', $vocab or die "Cannot open $vocab: $!";

my @lines = <$fh>;
close $fh;

chomp @lines;
for my $line (@lines) {
	
}

#print Dumper(\@lines);
	# commented out to shorten output, but can also comment back in
		# to show the list for comparison
my $argnum;  
foreach $argnum (1 .. $#ARGV) {
my $data = do{
	open my $fh, '<',  $ARGV[$argnum] or die "Cannot open  $ARGV[$argnum]: $!";
	local $/;
	<$fh>;
};

my $total = 0;
my $matches = 0;
while ($data =~ /(\S+)/g ) {
my $word = $1;
if ( grep { $_ eq $word} @lines) {
    $matches++;
   	printf "%2d: %s\n", $matches, $word;
}
$total++;
}

my $score = $matches/$total; 
print "The total number of words in this document is $total\n";
print "The total number of matches in this document is $matches\n";
print "The score of matches is $score\n";
$collection{$ARGV[$argnum]}  = $score;
}

print "\n\tDocuments sorted by Match Score:\n";
foreach my $title (sort {$collection{$b} <=> $collection{$a}} keys (%collection))
{
    print "$title: $collection{$title}\n";
}


#edits: exit the program if there is less than 2 arguments 



