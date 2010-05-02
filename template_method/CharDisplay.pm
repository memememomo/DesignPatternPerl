package CharDisplay;
use strict;
use warnings;
use base qw/AbstractDisplay/;

sub new {
    my $class = shift;
    my ($ch) = @_;
    bless {ch => $ch}, $class;
}

sub open {
    print "<<";
}

sub print {
    my $self = shift;
    print $self->{ch};
}

sub close {
    print ">>\n";
}

1;
