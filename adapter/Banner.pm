package Banner;
use strict;
use warnings;

sub new {
    my $class = shift;
    my ($string) = @_;
    bless {string => $string}, $class;
}

sub show_with_paren {
    my $self = shift;
    print '(' . $self->{string} . ')'."\n";
}

sub show_with_aster {
    my $self = shift;
    print '*' . $self->{string} . '*'."\n";
}

1;
