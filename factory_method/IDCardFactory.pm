package IDCardFactory;
use strict;
use warnings;
use base qw/Framework::Factory/;
use IDCard;

sub new {
    my $class = shift;
    my $self = $class->SUPER::new();
    $self->{owners} = [];
    $self;
}

sub create_product {
    my $self = shift;
    my ($owner) = @_;
    return IDCard->new($owner);
}

sub register_product {
    my $self = shift;
    my ($product) = @_;

    push @{$self->{owners}}, $product->get_owner();
}

sub get_owners {
    my $self = shift;
    return $self->{owners};
}

1;
