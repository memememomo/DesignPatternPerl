package Singleton;
use Any::Moose;


my $singleton = Singleton->new();


sub BUILDARGS {
    my $class = shift;

    my ($package_name) = caller;
    if ($package_name ne 'Singleton') {
	die "Can't call constructor.";
    }
    
    return {};
}


sub get_instance { $singleton }


1;
