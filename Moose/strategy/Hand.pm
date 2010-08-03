package Hand;
use Any::Moose;

use constant {
    HANDVALUE_GUU => 0,
    HANDVALUE_CHO => 1,
    HANDVALUE_PAA => 2
};


has handvalue => (
    is  => 'rw',
    isa => 'Int',
    );

my @name = ("グー","チョキ","パー");
my @hand = (Hand->new(HANDVALUE_GUU), Hand->new(HANDVALUE_CHO), Hand->new(HANDVALUE_PAA));



sub BUILDARGS {
    my ($class, $handvalue) = @_;
    return { handvalue => $handvalue };
}


sub get_hand {
    my ($self, $handvalue) = @_;
    return $hand[$handvalue];
}


sub is_stronger_than {
    my ($self, $h) = @_;
    return ($self->_fight($h) == 1) ? 1 : 0;
}


sub is_weaker_than {
    my ($self, $h) = @_;
    return ($self->_fight($h) == -1) ? 1 : 0;
}


sub _fight {
    my ($self, $h) = @_;
    
    if ($self == $h) {
	return 0;
    } elsif (($self->handvalue + 1) % 3 == $h->handvalue) {
	return 1;
    } else {
	return -1;
    }
}


sub to_string {
    my $self = shift;
    return $name[$self->handvalue];
}


1;
