package File;
use Any::Moose;
with 'Entry', 'Element';


has name => (
    is  => 'rw',
    isa => 'Str',
    );


has size => (
    is  => 'rw',
    isa => 'Int',
    );


sub BUILDARGS {
    my ($class, $name, $size) = @_;
    return { name => $name, size => $size };
}


sub get_name { shift->name }
sub get_size { shift->size }


sub accept {
    my ($self, $v) = @_;
    $v->visit($self);
}


1;
