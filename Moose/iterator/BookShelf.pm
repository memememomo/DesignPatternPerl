package BookShelf;
use Any::Moose;

use BookShelfIterator;


has maxsize => (
    is  => 'rw',
    isa => 'Int',
    );


has books => (
    is  => 'rw',
    isa => 'ArrayRef',
    lazy => 1,
    default => sub {[]},
    );


has last => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
    );


sub BUILDARGS {
    my ($class, $maxsize) = @_;
    return { maxsize => $maxsize };
}


sub get_book_at {
    my ($self, $index) = @_;
    return $self->books->[$index];
}


sub append_book {
    my ($self, $book) = @_;
    $self->books->[$self->last] = $book;
    $self->last($self->last + 1);
}


sub get_length { shift->last }


sub iterator {
    my $self = shift;
    return BookShelfIterator->new($self);
}


1;
