package main;
use strict;
use warnings;
use Display;
use CountDisplay;
use StringDisplayImpl;

my $d1 = Display->new(StringDisplayImpl->new("Hello, Japan."));
my $d2 = CountDisplay->new(StringDisplayImpl->new("Hello, World."));
my $d3 = CountDisplay->new(StringDisplayImpl->new("Hello, Universe."));

$d1->display();
$d2->display();
$d3->display();
$d3->multi_display(5);


