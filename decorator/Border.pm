package Border;
use strict;
use warnings;
use base qw/Display/;


sub new {
    my $class = shift;
    my ($display) = @_;
    my $self = $class->SUPER::new();
    $self->{display} = $display;
    $self;
}

1;
