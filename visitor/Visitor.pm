package Visitor;
use strict;
use warnings;

sub new {
    my $class = shift;
    if ($class eq __PACKAGE__) {
	die "Visitor is abstract.";
    }
	
    bless {}, $class;
}

sub visit { die "visit() is abstract." }


1;
