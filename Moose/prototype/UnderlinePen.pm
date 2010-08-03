package UnderlinePen;
use Any::Moose;
with 'Framework::Product';


has ulchar => (
    is  => 'rw',
    isa => 'Str',
    );


sub BUILDARGS {
    my ($self, $ulchar) = @_;
    return { ulchar => $ulchar };
}


sub use {
    my ($self, $s) = @_;

    my $length = length $s;
    print "\"" . $s . "\"\n";
    print " ";
    for my $i (0..$length-1) {
	print $self->ulchar;
    }
    print "\n";
}


sub create_clone {
    my $self = shift;

    my $p;
    eval { $p = $self->clone(); };
    die if($@);

    return $p;
}


1;
