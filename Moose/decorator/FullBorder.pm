package FullBorder;
use Any::Moose;
extends 'Border';


sub BUILDARGS {
    my ($class, $display) = @_;
    return { display => $display };
}


sub get_columns {
    my $self = shift;
    return 1 + $self->display->get_columns() + 1;
}


sub get_rows {
    my $self = shift;
    return 1 + $self->display->get_rows() + 1;
}


sub get_row_text {
    my ($self, $row) = @_;

    if ($row == 0) {
	return "+" . $self->make_line('-', $self->display->get_columns()) . "+";
    } elsif ($row == $self->display->get_rows() + 1) {
	return "+" . $self->make_line('-', $self->display->get_columns()) . "+";
    } else {
	return "|" . $self->display->get_row_text($row - 1) . "|";
    }
}


sub make_line {
    my ($self, $ch, $count) = @_;

    my $buf = '';
    for my $i (0..$count-1) {
	$buf .= $ch;
    }
    return $buf;
}


1;
