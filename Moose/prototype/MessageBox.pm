package MessageBox;
use Any::Moose;
with 'Framework::Product';

use Framework::Manager;


has decochar => (
    is  => 'rw',
    isa => 'Str',
    );


sub BUILDARGS {
    my ($class, $decochar) = @_;
    return { decochar => $decochar };
}


sub use {
    my ($self, $s) = @_;

    my $length = length $s;
    for my $i (0..$length + 3) {
	print $self->decochar;
    }
    print "\n";
    print $self->decochar . " " . $s . " " . $self->decochar . "\n";
    for my $i (0..$length + 3) {
	print $self->decochar;
    }
    print "\n";
}


sub create_clone {
    my $self = shift;

    my $p;
    eval { $p = $self->clone(); };
    die $@ if($@);

    return $p;
}

1;
