package Framework::Manager;
use strict;
use warnings;
use Clone;

sub new {
    my $class = shift;
    bless {showcase => {}}, $class;
}

sub register {
    my $self = shift;
    my ($name, $proto) = @_;

    $self->{showcase}->{$name} = $proto;
}

sub create {
    my $self = shift;
    my ($protoname) = @_;

    my $p = $self->{showcase}->{$protoname};
    return Clone::clone($p);
}

1;
