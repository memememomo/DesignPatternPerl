package Display;
use Any::Moose;


sub get_columns  { die "get_columns() is abstract."  }
sub get_rows     { die "get_rows() is abstract."     }
sub get_row_text { die "get_row_text() is abstract." }


sub show {
    my $self = shift;
    my $rows = $self->get_rows() - 1;
    for my $i (0..$rows) {
	print $self->get_row_text($i), "\n";
    }
}


1;
