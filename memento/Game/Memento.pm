package Game::Memento;
use strict;
use warnings;


sub new {
    my $class = shift;
    my ($money) = @_;
    bless {
	money => $money,
	fruits => [],
    }, $class;
}

sub add_fruit {
    my $self = shift;
    my ($fruit) = @_;
    push @{$self->{fruits}}, $fruit;
}

sub get_fruits {
    my $self = shift;
    my @fruits = @{$self->{fruits}};
    return \@fruits;
}

sub get_money { shift->{money} }

1;
