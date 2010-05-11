package SpecialSupport;
use strict;
use warnings;
use base qw/Support/;

sub new {
    my $class = shift;
    my ($name, $number) = @_;
    my $self = $class->SUPER::new($name);
    $self->{number} = $number;
    $self;
}

sub resolve {
    my $self = shift;
    my ($trouble) = @_;
    if ($trouble->get_number() == $self->{number}) {
	return 1;
    } else {
	return 0;
    }
}

1;
