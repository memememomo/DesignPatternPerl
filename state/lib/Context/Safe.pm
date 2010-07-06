package Context::Safe;
use strict;
use warnings;
use base qw/Context/;
use State::Day;
use State::Night;

my $state = State::Day->get_instance();

sub action_performed {
    my ($self, $e) = @_;

    print "$e\n";
    if ($e eq 'buttonUse') {
	$state->do_use($self);
    } elsif ($e eq 'buttonAlarm') {
	$state->do_alarm($self);
    } elsif ($e eq 'buttonPhone') {
	$state->do_phone($self);
    } elsif ($e eq 'buttonExit') {
	exit;
    } else {
	print "?\n";
    }
}


sub set_clock {
    my ($self, $hour) = @_;
    my $clockstring = "現在時刻は";
    if ($hour < 10) {
	$clockstring .= "0" . $hour . ":00";
    } else {
	$clockstring .= $hour . ":00";
    }
    print $clockstring, "\n";
    $self->{text_clock} = $clockstring;
    $state->do_clock($self, $hour);
}


sub change_state {
    my ($self, $s) = @_;
    print $s->to_string() . "から" . $state->to_string() . "へ状態が変化しました。\n";
    $state = $s;
}


sub call_security_center {
    my ($self, $msg) = @_;
    $self->{text_screen} = "call! " . $msg . "\n";
    print $self->{text_screen}, "\n";
}


sub record_log {
    my ($self, $msg) = @_;
    $self->{text_screen} = "record ... " . $msg . "\n";
    print $self->{text_screen}, "\n";
}


1;
