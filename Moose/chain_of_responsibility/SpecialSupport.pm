package SpecialSupport;
use Any::Moose;
extends 'Support';


has number => (
    is  => 'rw',
    isa => 'Int',
    );


sub BUILDARGS {
    my ($self, $name, $number) = @_;

    return { name => $name, number => $number };
}


sub resolve {
    my $self = shift;
    my ($trouble) = @_;
    if ($trouble->get_number() == $self->number) {
	return 1;
    } else {
	return 0;
    }
}


1;
