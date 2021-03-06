package AbstractDisplay;
use strict;
use warnings;

sub new { bless {}, shift }

sub open  { die "open() is abstract." }
sub print { die "print() is abstract." }
sub close { die "close() is abstract." }

sub display {
    my $self = shift;

    $self->open();
    for (my $i = 0; $i < 5; $i++) {
	$self->print();
    }
    $self->close();
}

1;
