package Trouble;
use Any::Moose;

has number => (
    is  => 'rw',
    isa => 'Int',
    );


sub BUILDARGS {
    my ($self, $number) = @_;
    
    if (defined $number) {
	return { number => $number };
    }

    return {};
}


sub get_number { shift->number }


sub to_string {
    my $self = shift;
    return "[Trouble ". $self->number . "]";
}


1;
