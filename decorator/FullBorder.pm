package FullBorder;
use strict;
use warnings;
use base qw/Border/;


sub new {
    my $class = shift;
    my ($display) = @_;
    $class->SUPER::new($display);
}

sub get_columns {
    my $self = shift;
    return 1 + $self->{display}->get_columns() + 1;
}

sub get_rows {
    my $self = shift;
    return 1 + $self->{display}->get_rows() + 1;
}

sub get_row_text {
    my $self = shift;
    my ($row) = @_;
    if ($row == 0) {
	return "+" . $self->make_line('-', $self->{display}->get_columns()) . "+";
    } elsif ($row == $self->{display}->get_rows() + 1) {
	return "+" . $self->make_line('-', $self->{display}->get_columns()) . "+";
    } else {
	return "|" . $self->{display}->get_row_text($row - 1) . "|";
    }
}

sub make_line {
    my $self = shift;
    my ($ch, $count) = @_;

    my $buf = '';
    for (my $i = 0; $i < $count; $i++) {
	$buf .= $ch;
    }
    return $buf;
}

1;
