package Strategy;
use strict;
use warnings;

sub new { 
    my $class = shift;
    if (__PACKAGE__ eq '$class') {
	die "__PACKAGE__ is interface.";
    } else {
	bless {}, $class; 
    }
}

sub next_hand { die "next_hand() is abstract."; }
sub study { die "study() is abstract."; }

1;
