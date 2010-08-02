package SideBorder;
use Any::Moose;
extends 'Border';


has border_char => (
    is  => 'rw',
    isa => 'Str',
    );


sub BUILDARGS {
    my ($self, $display, $ch) = @_;
    return { display => $display, border_char => $ch };
}


sub get_columns {
    my $self = shift;
    return 1 + $self->display->get_columns() + 1;
}


sub get_rows {
    my $self = shift;
    return $self->display->get_rows();
}


sub get_row_text {
    my ($self, $row) = @_;
    return $self->border_char . $self->display->get_row_text($row) . $self->border_char;
}


1;
