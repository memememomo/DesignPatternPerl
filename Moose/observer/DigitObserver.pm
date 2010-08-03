package DigitObserver;
use Any::Moose;
with 'Observer';


sub update {
    my ($self, $generator) = @_;

    print "DigitObserver:" . $generator->get_number() . "\n";
    sleep(1);
}


1;
