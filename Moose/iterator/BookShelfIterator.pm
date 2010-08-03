package BookShelfIterator;
use Any::Moose;
with 'Iterator';

use BookShelf;

has book_shelf => (
    is  => 'rw',
    isa => 'BookShelf',
    );


has index => (
    is  => 'rw',
    isa => 'Int',
    default => 0,
    );


sub BUILDARGS {
    my ($class, $book_shelf) = @_;
    return { book_shelf => $book_shelf };
}


sub has_next {
    my $self = shift;
    if ($self->index < $self->book_shelf->get_length()) {
	return 1;
    } else {
	return 0;
    }
}


sub next {
    my $self = shift;
    my $book = $self->book_shelf->get_book_at($self->index);
    $self->{index}++;
    return $book;
}


1;
