package main;
use strict;
use warnings;
use RandomNumberGenerator;
use Observer;
use DigitObserver;
use GraphObserver;


my $generator = RandomNumberGenerator->new();
my $observer1 = DigitObserver->new();
my $observer2 = GraphObserver->new();
$generator->add_observer($observer1);
$generator->add_observer($observer2);
$generator->execute();
