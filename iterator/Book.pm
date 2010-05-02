package Book;
use strict;
use warnings;

sub new {
    my $class = shift;
    my ($name) = @_;
    bless {name => $name}, $class;
}

sub get_name { shift->{name} }

1;
