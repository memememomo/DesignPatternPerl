use strict;
use warnings;

use PrinterProxy;

my $p = PrinterProxy->new('Alice');
print "名前は現在" . $p->get_printer_name() . "です。\n";
$p->set_printer_name('Bob');
print "名前は現在" . $p->get_printer_name() . "です。\n";
$p->print("Hello, world.");
