package Trouble;
use strict;
use warnings;

sub new {
    my $class = shift;
    my ($number) = @_;
    bless {number => $number}, $class;
}

sub get_number { shift->{number} }

sub to_string {
    my $self = shift;
    return "[Trouble " . $self->{number} . "]";
}

1;
