package BigString;
use strict;
use warnings;
use BigCharFactory;

sub new {
    my $class = shift;
    my ($string) = @_;
    
    my @bigchars = ();
    
    my $factory = BigCharFactory::get_instance();
    for my $c (split(//,$string)) {
	push @bigchars, $factory->get_big_char($c);
    }

    bless { bigchars => \@bigchars }, $class;
}

sub print {
    my $self = shift;
    for my $bigchar (@{$self->{bigchars}}) {
	$bigchar->print();
    }
}


1;
