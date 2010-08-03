package BigCharFactory;
use Any::Moose;

use BigChar;


my $singleton = BigCharFactory->new;


has pool => (
    is      => 'rw',
    isa     => 'HashRef',
    lazy    => 1,
    default => sub {{}},
    );


sub BUILDARGS {
    my $class = shift;
    my ($package) = caller;
    if ($package ne __PACKAGE__) {
	die "Can't this class";
    } 

    return {};
}


sub get_instance { $singleton }


sub get_big_char {
    my ($self, $charname) = @_;

    my $bc = $self->pool->{$charname};
    unless ($bc) {
	$bc = BigChar->new($charname);
	$self->pool->{$charname} = $bc;
    }

    return $bc;
}


1;

