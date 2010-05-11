package BigCharFactory;
use strict;
use warnings;
use BigChar;

my $singleton = BigCharFactory->new;

sub new {
    my $class = shift;
    my ($package) = caller;
    if ($package ne __PACKAGE__) {
	die "Can't this class";
    } else {
	bless {}, $class;
    }
}

sub get_instance { $singleton }

sub get_big_char {
    my $self = shift;
    my ($charname) = @_;

    my $bc = $self->{pool}->{$charname};
    unless ($bc) {
	$bc = BigChar->new($charname);
	$self->{pool}->{$charname} = $bc;
    }
    
    return $bc;
}

1;
