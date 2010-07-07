package Entry::File;
use strict;
use warnings;
use base qw/Entry/;

sub new {
    my ($class, $name, $size) = @_;
    my $self = $class->SUPER::new();
    $self->{name} = $name;
    $self->{size} = $size;
    $self;
}

sub get_name {
    my ($self) = @_;
    return $self->{name};
}

sub get_size {
    my ($self) = @_;
    return $self->{size};
}

sub print_list {
    my ($self, $prefix) = @_;
    $prefix ||= '';
    print $prefix . "/" . $self->to_string() . "\n";
}

1;
