package Builder;
use strict;
use warnings;

sub new {
    my $class = shift;

    if ($class eq __PACKAGE__) {
	die "Builder is abstract.";
    } 

    bless {}, $class;
}

sub make_title  { die "make_title() is abstract." }
sub make_string { die "make_string() is abstract." }
sub make_items  { die "make_items() is abstract." }
sub close       { die "close() si abstract." }

1;
