package Directory;
use strict;
use warnings;
use base qw/Entry/;


sub new {
    my $class = shift;
    my ($name) = @_;
    my $self = $class->SUPER::new();
    $self->{name} = $name;
    $self->{dir} = [];
    $self;
}

sub get_name {
    my $self = shift;
    return $self->{name};
}

sub get_size {
    my $self = shift;

    my $size = 0;
    for my $entry (@{$self->{dir}}) {
	$size += $entry->get_size();
    }

    return $size;
}

sub add {
    my $self = shift;
    my ($entry) = @_;

    push @{$self->{dir}},$entry;
    return $self;
}

sub iterator {
    my $self = shift;
    return $self->{dir};
}

sub accept {
    my $self = shift;
    my ($v) = @_;
    $v->visit($self);
}

1;
