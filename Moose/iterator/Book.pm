package Book;
use Any::Moose;


has name => (
    is  => 'rw',
    isa => 'Str',
    );


sub BUILDARGS {
    my ($class, $name) = @_;
    return { name => $name };
}


sub get_name { shift->name }


1;
