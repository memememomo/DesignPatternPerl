package CountDisplay;
use strict;
use warnings;
use base qw/Display/;

sub new {
    my $class = shift;
    my ($impl) = @_;
    $class->SUPER::new($impl);
}

sub multi_display {
    my $self = shift;
    my ($times) = @_;

    $self->open();
    for (my $i = 0; $i < $times; $i++) {
	$self->print();
    }
    $self->close();
}

1;
