package FileTreatmentException;
use strict;
use warnings;

sub new {
    my ($class, $msg) = @_;
    my $self = bless {}, $class;
    $self->{msg} = $msg;
    $self;
}

1;
