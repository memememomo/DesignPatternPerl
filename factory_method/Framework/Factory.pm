package Framework::Factory;
use strict;
use warnings;


sub new {
    my $class = shift;
    
    if ($class eq __PACKAGE__) {
	die "Factory is abstract.";
    }

    bless {}, $class;
}

sub create {
    my $self = shift;
    my ($owner) = @_;

    my $p = $self->create_product($owner);
    $self->register_product($p);
    return $p;
}

sub create_product   { die "create_product() is abstract." }
sub register_product { die "register_product() is abstract." }

1;
