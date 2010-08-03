package IDCardFactory;
use Any::Moose;
with 'Framework::Factory';

use IDCard;


has owners => (
    is  => 'rw',
    isa => 'ArrayRef',
    default => sub {[]},
    );


sub create_product {
    my ($self, $owner) = @_;
    return IDCard->new($owner);
}


sub register_product {
    my ($self, $product) = @_;
    push @{$self->owners}, $product->get_owner();
}


sub get_owners { shift->owners }


1;
