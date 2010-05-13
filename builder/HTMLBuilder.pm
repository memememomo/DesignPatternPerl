package HTMLBuilder;
use strict;
use warnings;
use base qw/Builder/;

sub make_title {
    my $self = shift;
    my ($title) = @_;
    $self->{filename} = $title . ".html";
    
    open my $fh, '>', $self->{filename} or die "Can't open : $!";
    $self->{writer} = $fh;
    
    print $fh "<html><head><title>" . $title . "</title></head><body>\n";
    print $fh "<h1>" . $title . "</h1>";
}

sub make_string {
    my $self = shift;
    my ($str) = @_;

    my $fh = $self->{writer};
    print $fh "<p>" . $str . "</p>";
}

sub make_items {
    my $self = shift;
    my @items = @_;

    my $fh = $self->{writer};
    print $fh "<ul>\n";
    for my $item (@items) {
	print $fh "<li>" . $item . "</li>\n";
    }
    print $fh "</ul>\n";
}

sub close {
    my $self = shift;

    my $fh = $self->{writer};
    print $fh "</body></html>\n";
    close($fh);
}

sub get_result {
    my $self = shift;
    return $self->{filename};
}

1;
    
