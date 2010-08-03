package Game::Memento;
use Any::Moose;


has money => (
    is  => 'rw',
    isa => 'Int',
    );


has fruits => (
    is      => 'rw',
    isa     => 'ArrayRef',
    lazy    => 1,
    default => sub {[]},
    );


sub BUILDARGS {
    my ($class, $money) = @_;
    return { money => $money };
}


sub add_fruit {
    my ($self, $fruit) = @_;
    push @{$self->fruits}, $fruit;
}


sub get_fruits {
    my $self = shift;
    return @{$self->fruits};
}


sub get_money { shift->money }


1;
