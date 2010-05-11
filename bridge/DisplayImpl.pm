package DisplayImpl;
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

sub raw_open  { die "raw_open() is abstract." }
sub raw_print { die "raw_print() is abstract." }
sub raw_close { die "raw_close() is abstract." }

1;
