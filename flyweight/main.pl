package main;
use strict;
use warnings;
use BigString;

my $args = $ARGV[0];

unless (defined $args) {
    die "Usage: perl main.pl digits\n Example: perl main.pl 1212123";
}

my $bs = BigString->new($args);
$bs->print();
