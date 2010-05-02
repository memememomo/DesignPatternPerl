use strict;
use warnings;
use BookShelf;
use Book;

my $book_shelf = BookShelf->new(4);
$book_shelf->append_book(Book->new("Around the World in 80 Days"));
$book_shelf->append_book(Book->new("Bible"));
$book_shelf->append_book(Book->new("Cinderelia"));
$book_shelf->append_book(Book->new("Daddy-Long-Legs"));
my $it = $book_shelf->iterator();
while ($it->has_next()) {
    my $book = $it->next();
    print $book->get_name(), "\n";
}
