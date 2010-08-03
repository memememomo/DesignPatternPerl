package WinningStrategy;
use Any::Moose;
with 'Strategy';

use Hand;


has won => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
    );


has prev_hand => (
    is  => 'rw',
    isa => 'Hand',
    );


sub next_hand {
    my $self = shift;
    if (!$self->won) {
	$self->prev_hand(Hand->get_hand(int(rand(3))));
    }
    return $self->prev_hand;
}


sub study {
    my ($self, $win) = @_;
    $self->won($win);
}


1;
