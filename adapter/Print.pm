package Print;
use strict;
use warnings;

sub new { bless {}, shift }

sub print_weak {
    die "print_weak is abstract.";
}

sub print_strong {
    die "print_strong is abstract.";
}

1;
