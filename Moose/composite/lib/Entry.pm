package Entry;
use Any::Moose;


sub get_name { die "get_name() is abstract." }
sub get_size { die "get_name() is abstract." }

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
    my $self = shift;
    return $self->get_name() . " (" . $self->get_size() . ")";
}


1;
