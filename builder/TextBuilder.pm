package TextBuilder;
use strict;
use warnings;
use base qw/Builder/;

sub make_title {
    my $self = shift;
    my ($title) = @_;

    $self->{buffer} .= "====================================\n";
    $self->{buffer} .= " 『" . $title . "』\n";
    $self->{buffer} .= "\n";
}

sub make_string {
    my $self = shift;
    my ($str) = @_;
    
    $self->{buffer} .= '■' . $str . "\n";
    $self->{buffer} .= "\n";
}

sub make_items {
    my $self = shift;
    my @items = @_;

    for my $item (@items) {
	$self->{buffer} .= " ・" . $item . "\n";
    }
    $self->{buffer} .= "\n";
}

sub close {
    my $self = shift;
    $self->{buffer} .=  "====================================\n";
}

sub get_result {
    my $self = shift;
    return $self->{buffer};
}

1;
    
