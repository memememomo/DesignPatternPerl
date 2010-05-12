package StringDisplay;
use strict;
use warnings;
use base qw/Display/;

sub new {
    my $class = shift;
    my ($string) = @_;
    my $self = $class->SUPER::new();
    $self->{string} = $string;
    $self;
}

sub get_columns {
    my $self = shift;
    return length $self->{string};
}

sub get_rows {
    return 1;
}

sub get_row_text {
    my $self = shift;
    my ($row) = @_;
    if ($row == 0) {
	return $self->{string};
    } else {
	return undef;
    }
}

1;
