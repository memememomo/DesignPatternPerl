package CharDisplay;
use Any::Moose;
extends 'AbstractDisplay';


has ch => (
    is  => 'rw',
    isa => 'Str',
    );


sub BUILDARGS {
    my ($class, $ch) = @_;
    return { ch => $ch };
}


sub open { print "<<" }


sub print {
    my $self = shift;
    print $self->ch;
}


sub close {
    print ">>\n";
}


1;
