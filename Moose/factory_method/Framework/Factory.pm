package Framework::Factory;
use Any::Moose '::Role';
requires qw/create_product register_product/;

sub create {
    my ($self, $owner) = @_;

    my $p = $self->create_product($owner);
    $self->register_product($p);
    return $p;
}


1;
