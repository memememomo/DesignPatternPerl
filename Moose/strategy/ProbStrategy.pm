package ProbStrategy;
use Any::Moose;
with 'Strategy';


has prev_hand_value => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
    );


has current_hand_value => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
    );


has history => (
    is      => 'rw',
    isa     => 'ArrayRef',
    default => sub {
	[ [ 1, 1, 1 ],
	  [ 1, 1, 1 ],
	  [ 1, 1, 1 ]
	];
    });


sub next_hand {
    my $self = shift;

    my $current_hand_value = $self->current_hand_value;
    my $bet = int(rand($self->get_sum($current_hand_value)));
    my $handvalue = 0;
    if ($bet < $self->history->[$current_hand_value][0]) {
	$handvalue = 0;
    } elsif ($bet < $self->history->[$current_hand_value][0] + $self->history->[$current_hand_value][1]) {
	$handvalue = 1;
    } else {
	$handvalue = 2;
    }
    $self->prev_hand_value($current_hand_value);
    $self->current_hand_value($handvalue);
    return Hand->get_hand($handvalue);
}


sub get_sum {
    my ($self, $hv) = @_;

    my $sum = 0;
    for my $i (0..2) {
	$sum += $self->history->[$hv][$i];
    }
    return $sum;
}


sub study {
    my ($self, $win) = @_;

    my $prev_hand_value = $self->prev_hand_value;
    my $current_hand_value = $self->current_hand_value;

    if ($win) {
	$self->history->[$prev_hand_value][$current_hand_value]++;
    } else {
	$self->history->[$prev_hand_value][($current_hand_value + 1) % 3]++;
	$self->history->[$prev_hand_value][($current_hand_value + 2) % 3]++;
    }
}


1;
