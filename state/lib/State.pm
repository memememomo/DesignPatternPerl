package State;
use strict;
use warnings;

sub new {
    my ($class) = @_;
    bless {}, $class;
}

sub do_clock {
    my ($self, $context, $hour) = @_;
    die '"do_clock" is abstract.';
}

sub do_use {
    my ($self, $context) = @_;
    die '"do_use" is abstract.';
}

sub do_alarm {
    my ($self, $context) = @_;
    die '"do_alarm" is abstract.';
}

sub do_phone {
    my ($self, $context) = @_;
    die '"do_phone" is abstract.';
}

1;
