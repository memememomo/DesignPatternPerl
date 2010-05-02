package StringDisplay;
use strict;
use warnings;
use base qw/AbstractDisplay/;

sub new {
    my $class = shift;
    my ($string) = @_;
    my $width = length $string;
    bless {string => $string, width => $width}, $class;
}

sub open {
    my $self = shift;
    $self->print_line();
}

sub print {
    my $self = shift;
    print '|' . $self->{string} . '|' . "\n";
}

sub close {
    my $self = shift;
    $self->print_line();
}

sub print_line {
    my $self = shift;

    print "+";
    for (my $i = 0; $i < $self->{width}; $i++) {
	print '-';
    }
    print "+\n";
}

1;
