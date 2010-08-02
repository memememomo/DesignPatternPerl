package Entry::Directory;
use Any::Moose;
extends 'Entry';


has name => (
    is  => 'rw',
    isa => 'Str',
    );


has directory => (
    is  => 'rw',
    isa => 'ArrayRef',
    default => sub {[]},
    );


sub BUILDARGS {
    my ($class, $name) = @_;
    return { name => $name };
}


sub get_name {
    my ($self) = @_;
    return $self->name;
}


sub get_size {
    my ($self) = @_;
    my $size = 0;
    for my $entry (@{$self->directory}) {
	$size += $entry->get_size();
    }
    return $size;
}


sub add {
    my ($self, $entry) = @_;
    push @{$self->directory}, $entry;
    $self;
}


sub print_list {
    my ($self, $prefix) = @_;
    $prefix ||= '';
    print $prefix . "/" . $self->to_string() . "\n";
    for my $entry (@{$self->directory}) {
	$entry->print_list($prefix . "/" . $self->name);
    }
}


1;
