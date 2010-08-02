package Entry::File;
use Any::Moose;
extends 'Entry';


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


sub get_name {
    my ($self) = @_;
    return $self->name;
}


sub get_size {
    my ($self) = @_;
    return $self->size;
}


sub print_list {
    my ($self, $prefix) = @_;
    $prefix ||= '';
    print $prefix . "/" . $self->to_string() . "\n";
}


1;
