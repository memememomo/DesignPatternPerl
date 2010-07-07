package Entry::Directory;
use strict;
use warnings;
use base qw/Entry/;

sub new {
    my ($class, $name) = @_;
    my $self = $class->SUPER::new();
    $self->{name} = $name;
    $self->{directory} = [];
    $self;
}

sub get_name {
    my ($self) = @_;
    return $self->{name};
}

sub get_size {
    my ($self) = @_;
    my $size = 0;
    for my $entry (@{$self->{directory}}) {
	$size += $entry->get_size();
    }
    return $size;
}

sub add {
    my ($self, $entry) = @_;
    push @{$self->{directory}}, $entry;
    return $self;
}

sub print_list {
    my ($self, $prefix) = @_;
    $prefix ||= '';
    print $prefix . "/" . $self->to_string() . "\n";
    for my $entry (@{$self->{directory}}) {
	$entry->print_list($prefix . "/" . $self->{name});
    }
}

1;
