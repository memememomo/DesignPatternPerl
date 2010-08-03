package GraphObserver;
use Any::Moose;
with 'Observer';


sub update {
    my ($self, $generator) = @_;

    print "GraphObserver:";
    my $count = $generator->get_number();
    for my $i (0..$count-1) {
	print "*";
    }
    print "\n";
    sleep(1);
}


1;
