package RandomNumberGenerator;
use strict;
use warnings;
use base qw/NumberGenerator/;

sub get_number {
    my $self = shift;
    return $self->{number};
}

sub execute {
    my $self = shift;
    for (my $i = 0; $i < 20; $i++) {
	$self->{number} = int(rand(50));
	$self->notify_observers();
    }
}

1;
