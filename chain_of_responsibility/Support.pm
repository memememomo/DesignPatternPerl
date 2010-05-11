package Support;
use strict;
use warnings;

sub new {
    my $class = shift;
    my ($name) = @_;
    bless {name => $name}, $class;
}

sub set_next {
    my $self = shift;
    my ($next) = @_;
    $self->{next} = $next;
    return $next;
}

sub support {
    my $self = shift;
    my ($trouble) = @_;

    if ($self->resolve($trouble)) {
	$self->done($trouble);
    } elsif ($self->{next}) {
	$self->{next}->support($trouble);
    } else {
	$self->fail($trouble);
    }
}

sub to_string {
    my $self = shift;
    return "[" . $self->{name} . "]";
}

sub resolve { die "Please override resolve()" };

sub done {
    my $self = shift;
    my ($trouble) = @_;
    print $trouble->to_string() . " is resolved by " . $self->to_string() . ".\n";
}

sub fail {
    my $self = shift;
    my ($trouble) = @_;
    print $trouble->to_string() . " cannot be resolved.\n";
}

1;
