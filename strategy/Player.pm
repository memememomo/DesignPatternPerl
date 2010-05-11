package Player;
use strict;
use warnings;

sub new {
    my $class = shift;
    my ($name, $strategy) = @_;
    bless {name => $name, 
	   strategy => $strategy,
	   wincount => 0,
	   losecount => 0,
	   gamecount => 0,
    }, $class;
}

sub next_hand {
    my $self = shift;
    return $self->{strategy}->next_hand();
}

sub win {
    my $self = shift;
    $self->{strategy}->study(1);
    $self->{wincount}++;
    $self->{gamecount}++;
}

sub lose {
    my $self = shift;
    $self->{strategy}->study(0);
    $self->{losecount}++;
    $self->{gamecount}++;
}

sub even {
    my $self = shift;
    $self->{gamecount}++;
}

sub to_string {
    my $self = shift;
    return "[" . $self->{name} . ":" . $self->{gamecount} . " games, " . $self->{wincount} . " win, " . $self->{losecount} . " lose" . "]";
}

1;
    
	
