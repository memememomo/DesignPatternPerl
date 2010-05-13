package IDCard;
use strict;
use warnings;
use base qw/Framework::Product/;


sub new {
    my $class = shift;
    my ($owner) = @_;
    my $self = $class->SUPER::new();
    print $owner . "のカードを作ります。\n";
    $self->{owner} = $owner;
    $self;
}
 
sub use {
    my $self = shift;
    print $self->{owner} . "のカードを使います。\n";
}

sub get_owner {
    my $self = shift;
    return $self->{owner};
}

1;
