package Player;
use Any::Moose;

use Strategy;


has name => (
    is  => 'rw',
    isa => 'Str',
    );


has wincount => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
    );


has losecount => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
    );


has gamecount => (
    is      => 'rw',
    isa     => 'Int',
    default => 0,
    );


has strategy => (
    is  => 'rw',
    isa => 'Strategy',
    );


sub BUILDARGS {
    my ($class, $name, $strategy) = @_;
    return { name => $name, strategy => $strategy };
}


sub next_hand {
    my $self = shift;
    return $self->strategy->next_hand();
}


sub win {
    my $self = shift;
    $self->strategy->study(1);
    $self->{wincount}++;
    $self->{gamecount}++;
}


sub lose {
    my $self = shift;
    $self->strategy->study(0);
    $self->{losecount}++;
    $self->{gamecount}++;
}


sub even {
    my $self = shift;
    $self->{gamecount}++;
}


sub to_string {
    my $self = shift;
    return "[" . $self->name . ":" . $self->gamecount . " games, " . $self->wincount . " win, " . $self->losecount . " lose" . "]";
}


1;
    
