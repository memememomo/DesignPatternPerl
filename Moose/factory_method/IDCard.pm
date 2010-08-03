package IDCard;
use Any::Moose;
with 'Framework::Product';


has owner => (
    is  => 'rw',
    isa => 'Str'
    );


sub BUILDARGS {
    my ($class, $owner) = @_;
    print $owner . "のカードを作ります。\n";
    return { owner => $owner };
}


sub use {
    my $self = shift;
    print $self->owner . "のカードを使います。\n";
}


sub get_owner { shift->owner }


1;

