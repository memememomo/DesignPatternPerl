package Entry;
use strict;
use warnings;
use base qw/Element/;


sub new {
    my $class = shift;
    
    if ($class eq __PACKAGE__) {
	die "Entry is abstract.";
    } 

    $class->SUPER::new();
}

sub get_name { die "get_name() is abstract." }
sub get_size { die "get_size() is abstract." }
sub add { die "throw FileTreatmentException." }
sub iterator { die "throw FileTreatmentException." }

sub to_string {
    my $self = shift;
    return $self->get_name() . " (" . $self->get_size() . ")";
}

1;
