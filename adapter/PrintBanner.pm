package PrintBanner;
use strict;
use warnings;
use base qw/Print/;
use Banner;

sub new {
    my $class = shift;
    my ($string) = @_;
    my $b = Banner->new($string);
    bless {banner => $b}, $class;
}

sub print_weak {
    my $self = shift;
    $self->{banner}->show_with_paren();
}

sub print_strong {
    my $self = shift;
    $self->{banner}->show_with_aster();
}

1;
