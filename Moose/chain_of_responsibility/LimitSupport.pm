package LimitSupport;
use Any::Moose;
extends 'Support';


has limit => (
    is  => 'rw',
    isa => 'Int',
    );


sub BUILDARGS {
    my ($self, $name, $limit) = @_;

    return { name => $name, limit => $limit };
}


sub resolve {
    my $self = shift;
    my ($trouble) = @_;
    if ($trouble->get_number() < $self->{limit}) {
	return 1;
    } else {
	return 0;
    }
}


1;
    

