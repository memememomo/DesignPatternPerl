package Framework::Product;
use Any::Moose '::Role';
requires qw/use create_clone/;

use Clone;


sub clone {
    my $self = shift;
    Clone::clone($self);
}


1;
