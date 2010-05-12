package SideBorder;
use strict;
use warnings;
use base qw/Border/;

sub new {
    my $class = shift;
    my ($display, $ch) = @_;

    my $self = $class->SUPER::new($display);
    $self->{border_char} = $ch;
    $self;
}

sub get_columns {
    my $self = shift;

    return 1 + $self->{display}->get_columns() + 1;
}

sub get_rows {
    my $self = shift;
    return $self->{display}->get_rows();
}

sub get_row_text {
    my $self = shift;
    my ($row) = @_;
    return $self->{border_char} . $self->{display}->get_row_text($row) . $self->{border_char};
}

1;
    
