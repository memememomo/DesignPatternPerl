package NoSupport;
use strict;
use warnings;
use base qw/Support/;

sub new {
    my $class = shift;
    my ($name) = @_;
    $class->SUPER::new($name);
}

sub resolve {
    return 0;
}

1;
