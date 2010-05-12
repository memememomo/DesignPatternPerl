package Element;
use strict;
use warnings;

sub new {
    my $class = shift;
    
    if ($class eq __PACKAGE__) {
	die "Element is abstract.";
    }

    bless {}, $class;
}

sub accept { die "accept() is abstract." }


1;
