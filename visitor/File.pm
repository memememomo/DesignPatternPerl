package File;
use strict;
use warnings;
use base qw/Entry/;

sub new {
    my $class = shift;
    my ($name, $size) = @_;
    my $self = $class->SUPER::new();
    $self->{name} = $name;
    $self->{size} = $size;
    $self;
}

sub get_name {
    my $self = shift;
    return $self->{name};
}

sub get_size {
    my $self = shift;
    return $self->{size};
}

sub accept {
    my $self = shift;
    my ($v) = @_;
    $v->visit($self);
}

1;

    
