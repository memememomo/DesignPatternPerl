package Entry;
use strict;
use warnings;

sub new {
    my ($class) = @_;
    bless {}, $class;
}

sub get_name {
    die "get_name() is abstract.";
}

sub get_size {
    die "get_size() is abstract.";
}

sub add {
    my ($self, $entry) = @_;
    die FileTreatmentException->new;
}

sub print_list {
    my ($self, $prefix) = @_;
    unless (defined $prefix) {
	$self->print_list("");
    }
}

sub to_string {
    my ($self) = @_;
    return $self->get_name() . " (" . $self->get_size() . ")";
}

1;
