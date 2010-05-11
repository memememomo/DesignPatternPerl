package Observer;
use strict;
use warnings;


sub new {
    my $class = shift;
    if (__PACKAGE__ eq $class) {
	die __PACKAGE__ . " is abstract.";
    } else {
	bless {}, $class;
    }
}

sub update { die "update() is abstract." }


1;
