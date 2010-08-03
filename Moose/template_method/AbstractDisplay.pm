package AbstractDisplay;
use Any::Moose;


sub open  { die "open() is abstract."  }
sub print { die "print() is abstract." }
sub close { die "close() is abstract." }


sub display {
    my $self = shift;

    $self->open();
    for my $i (0..4) {
	$self->print();
    }
    $self->close();
}

1;
