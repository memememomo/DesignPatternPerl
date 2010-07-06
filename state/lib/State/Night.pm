package State::Night;
use strict;
use warnings;
use base qw/State/;
use State::Day;

my $singleton = State::Night->new;

sub get_instance { $singleton }

sub do_clock {
    my ($self, $context, $hour) = @_;
    if (9 <= $hour && $hour < 17) {
	$context->change_state(State::Day->get_instance());
    }
}

sub do_use {
    my ($self, $context, $hour) = @_;
    $context->call_security_center("非常：夜間の金庫使用!");
}

sub do_alarm {
    my ($self, $context) = @_;
    $context->call_security_center("非常ベル(夜間)");
}

sub do_phone {
    my ($self, $context) = @_;
    $context->record_log("夜間の通話録音");
}

sub to_string {
    return "[夜間]";
}
