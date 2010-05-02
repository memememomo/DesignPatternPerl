package BookShelfIterator;
use strict;
use warnings;
use base qw/Iterator/;

sub new {
    my $class = shift;
    my ($book_shelf) = @_;
    bless {book_shelf => $book_shelf, index => 0}, $class;
}

sub has_next {
    my $self = shift;
    if ($self->{index} < $self->{book_shelf}->get_length()) {
	return 1;
    } else {
	return 0;
    }
}

sub next {
    my $self = shift;
    my $book = $self->{book_shelf}->get_book_at($self->{index});
    $self->{index}++;
    return $book;
}

1;
