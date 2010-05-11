package Display;
use strict;
use warnings;

sub new {
    my $class = shift;
    my ($impl) = @_;
    bless {impl => $impl}, $class;
}

sub open {
    my $self = shift;
    return $self->{impl}->raw_open();
}

sub print {
    my $self = shift;
    return $self->{impl}->raw_print();
}

sub close {
    my $self = shift;
    return $self->{impl}->raw_close();
}

sub display {
    my $self = shift;
    $self->open();
    $self->print();
    $self->close();
}

1;
