package Framework::Product;
use strict;
use warnings;
use Clone;

sub new { 
    my $class = shift;
    if ($class eq __PACKAGE__) {
	die "Product is abstract.";
    }

    bless {}, $class;
}

sub use { die "usr() is abstract." }
sub createClone { die "createClone() is abstract." }

sub clone { 
    my $self = shift;
    Clone::clone($self);
}
    
1;
