package StringDisplayImpl;
use strict;
use warnings;
use base qw/DisplayImpl/;

sub new {
    my $class = shift;
    my ($string) = @_;
    my $width = length $string;
    bless {string => $string, width => $width}, $class;
}

sub raw_open {
    my $self = shift;
    $self->print_line();
}

sub raw_print {
    my $self = shift;
    print "|" . $self->{string} . "|" . "\n";
}

sub raw_close {
    my $self = shift;
    $self->print_line();
}

sub print_line {
    my $self = shift;
    print "+";
    for (my $i = 0; $i < $self->{width}; $i++) {
	print "-";
    }
    print "+\n";
}

1;
