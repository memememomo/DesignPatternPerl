package BigString;
use Any::Moose;

use BigCharFactory;


has bigchars => (
    is  => 'rw',
    isa => 'ArrayRef',
    );


sub BUILDARGS {
    my ($class, $string) = @_;

    my @bigchars = ();

    my $factory = BigCharFactory::get_instance();
    for my $c (split(//,$string)) {
	push @bigchars, $factory->get_big_char($c);
    }

    return { bigchars => \@bigchars };
}


sub print {
    my $self = shift;
    for my $bigchar (@{$self->bigchars}) {
	$bigchar->print();
    }
}


1;
