package State::Day;
use strict;
use warnings;
use base qw/State/;
use State::Night;

my $singleton = State::Day->new;

sub get_instance { $singleton }

sub do_clock {
    my ($self, $context, $hour) = @_;
    if ($hour < 9 || 17 <= $hour) {
	$context->change_state(State::Night->get_instance());
    }
}

sub do_use {
    my ($self, $context) = @_;
    $context->record_log("金庫使用(昼間)");
}

sub do_alarm {
    my ($self, $context) = @_;
    $context->call_security_center("非常ベル(昼間)");
}

sub do_phone {
    my ($self, $context) = @_;
    $context->call_security_center("通常の通話(昼間)");
}

sub to_string {
    return "[昼間]";
}

1;
    
