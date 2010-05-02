package Printable;
use strict;
use warnings;

sub set_printer_name { die "set_printer_name() is abstract." }
sub get_printer_name { die "get_printer_name() is abstract." }
sub print { die "print() is abstract." }

1;
