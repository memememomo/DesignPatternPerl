package LimitSupport;
use strict;
use warnings;
use base qw/Support/;

sub new {
    my $class = shift;
    my ($name, $limit) = @_;

    my $self = $class->SUPER::new($name);
    $self->{limit} = $limit;
    $self;
}

sub resolve {
    my $self = shift;
    my ($trouble) = @_;

    if ($trouble->get_number() < $self->{limit}) {
	return 1;
    } else {
	return 0;
    }
}

1;
