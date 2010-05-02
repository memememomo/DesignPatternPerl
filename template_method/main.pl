use strict;
use warnings;

use CharDisplay;
use StringDisplay;

my $d1 = CharDisplay->new('H');
my $d2 = StringDisplay->new('Hello, world.');
my $d3 = StringDisplay->new('こんにちわ。');

$d1->display();
$d2->display();
$d3->display();
