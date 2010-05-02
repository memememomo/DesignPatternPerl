package Iterator;
use strict;
use warnings;

sub new { bless {}, shift; }

sub has_next { die "has_next() is abstract"; }
sub next { die "next() is abstract"; }

1;
