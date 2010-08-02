package OddSupport;
use Any::Moose;
extends 'Support';


sub resolve {
    my $self = shift;
    my ($trouble) = @_;
    if ($trouble->get_number() % 2 == 1) {
	return 1;
    } else {
	return 0;
    }
}


1;
