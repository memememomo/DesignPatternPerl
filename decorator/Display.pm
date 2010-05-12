package Display;
use strict;
use warnings;


sub new {
    my $class = shift;
    bless {}, $class;
}


sub get_columns  { die "get_columns() is abstract."  }
sub get_rows     { die "get_rows() is abstract."     }
sub get_row_text { die "get_row_text() is abstract." }


sub show {
    my $self = shift;
    for (my $i = 0; $i < $self->get_rows(); $i++) {
	print $self->get_row_text($i), "\n";
    }
}


1;
