package WinningStrategy;
use strict;
use warnings;
use base qw/Strategy/;
use Hand;

sub new {
    my $class = shift;
    bless {won => 0}, $class;
}

sub next_hand {
    my $self = shift;
    if (!$self->{won}) {
	$self->{prev_hand} = Hand->get_hand(int(rand(3)));
    }
    return $self->{prev_hand};
}

sub study {
    my $self = shift;
    my ($win) = @_;
    $self->{won} = $win;
}

1;
