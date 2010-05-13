package Framework::Product;
use strict;
use warnings;

sub new {
    my $class = shift;
    
    if ($class eq __PACKAGE__) {
	die "Product is abstract.";
    }

    bless {}, $class;
}

sub use { die "use() is abstract." }

1;
