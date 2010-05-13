package Singleton;
use strict;
use warnings;

my $singleton = Singleton->new();

sub new {
    my $class = shift;

    my ($package_name) = caller;
    if ($package_name ne 'Singleton') {
	die "Can't call constructor.";
    } 

    bless {}, $class;
}

sub get_instance {
    return $singleton;
}

1;
