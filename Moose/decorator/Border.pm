package Border;
use Any::Moose;
extends 'Display';


has display => (
    is  => 'rw',
    isa => 'Display',
    );


sub BUILDARGS {
    my ($class, $display) = @_;
    return { display => $display };
}


1;

