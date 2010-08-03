package Entry;
use Any::Moose '::Role';
requires qw/get_name get_size to_string/;


sub iadd     { die "throw FileTreatmentException." }
sub iterator { die "throw FileTreatmentException." }

sub to_string {
    my $self = shift;
    return $self->get_name() . " (" . $self->get_size() . ")";
}


1;
