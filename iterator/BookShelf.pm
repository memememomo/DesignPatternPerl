package BookShelf;
use strict;
use warnings;
use BookShelfIterator;

sub new {
    my $class = shift;
    my ($maxsize) = @_;
    bless {maxsize => $maxsize, books => [], last => 0}, $class;
}

sub get_book_at {
    my ($self, $index) = @_;
    return $self->{books}->[$index];
}

sub append_book {
    my ($self, $book) = @_;
    $self->{books}->[$self->{last}] = $book;
    $self->{last}++;
}

sub get_length { shift->{last} }

sub iterator {
    my $self = shift;
    return BookShelfIterator->new($self);
}

1;
