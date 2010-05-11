package OddSupport;
use strict;
use warnings;
use base qw/Support/;

sub new {
    my $class = shift;
    my ($name) = @_;
    $class->SUPER::new($name);
}

sub resolve {
    my $self = shift;
    my ($trouble) = @_;
    if ($trouble->get_number() % 2 == 1) {
	return 1;
    } else {
	return 0;
    }
}

1;
