package Directory;
use Any::Moose;
with 'Element', 'Entry';


has name => (
    is  => 'rw',
    isa => 'Str',
    );


has dir => (
    is      => 'rw',
    isa     => 'ArrayRef',
    lazy    => 1,
    default => sub {[]},
    );


sub BUILDARGS {
    my ($class, $name) = @_;
    return { name => $name };
}


sub get_name { shift->name }


sub get_size {
    my $self = shift;

    my $size = 0;
    for my $entry (@{$self->dir}) {
	$size += $entry->get_size();
    }

    return $size;
}


sub add {
    my ($self, $entry) = @_;

    push @{$self->dir}, $entry;
    $self;
}


sub iterator { shift->dir }


sub accept {
    my ($self, $v) = @_;
    $v->visit($self);
}


1;
    
