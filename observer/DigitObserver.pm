package DigitObserver;
use strict;
use warnings;
use base qw/Observer/;

sub update {
    my $self = shift;
    my ($generator) = @_;

    print "DigitObserver:" . $generator->get_number() , "\n";
    sleep(1);
}

1;
