package StringDisplay;
use Any::Moose;
extends 'Display';


has string => (
    is  => 'rw',
    isa => 'Str',
    );


sub BUILDARGS {
    my ($class, $string) = @_;
    return { string => $string };
}


sub get_columns {
    my $self = shift;
    return length $self->string;
}


sub get_rows { 1 }


sub get_row_text {
    my ($self, $row) = @_;

    if ($row == 0) {
	return $self->string;
    } else {
	return undef;
    }
}


1;
