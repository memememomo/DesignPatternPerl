package GraphObserver;
use strict;
use warnings;
use base qw/Observer/;

sub update {
    my $self = shift;
    my ($generator) = @_;
    print "GraphObserver:";
    my $count = $generator->get_number();
    for (my $i = 0; $i < $count; $i++) {
	print "*";
    }
    print "\n";
    sleep(1);
}

1;
