package Context;
use strict;
use warnings;


sub new {
    my ($class) = @_;
    bless {}, $class;
}

sub set_clock {
    my ($self, $hour) = @_;
    die '"set_clock" is abstract.';
}

sub change_state {
    my ($self, $state) = @_;
    die '"change_state" is abstract.';
}

sub call_security_center {
    my ($self, $msg) = @_;
    die '"call_security_center" is abstract.';
}

sub record_log {
    my ($self, $msg) = @_;
    die '"record_log" is abstract.';
}

1;
