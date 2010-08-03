package Framework::Manager;
use Any::Moose;

use Clone;


has showcase => (
    is      => 'rw',
    isa     => 'HashRef',
    lazy    => 1,
    default => sub {{}},
    );


sub register {
    my ($self, $name, $proto) = @_;

    $self->showcase->{$name} = $proto;
}


sub create {
    my ($self, $protoname) = @_;

    my $p = $self->showcase->{$protoname};
    return Clone::clone($p);
}


1;
