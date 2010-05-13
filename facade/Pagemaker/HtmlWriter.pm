package Pagemaker::HtmlWriter;
use strict;
use warnings;

sub new {
    my $class = shift;
    my ($writer) = @_;
    bless {writer => $writer}, $class;
}

sub title {
    my $self = shift;
    my ($title) = @_;

    my $fh = $self->{writer};
    print $fh "<html>";
    print $fh "<head>";
    print $fh "<title>" . $title . "</title>";
    print $fh "</head>";
    print $fh "<body>\n";
    print $fh "<h1>" . $title . "</h1>\n";
}

sub paragraph {
    my $self = shift;
    my ($msg) = @_;
    
    my $fh = $self->{writer};
    print $fh "<p>" . $msg . "</p>\n";
}

sub link {
    my $self = shift;
    my ($href, $caption) = @_;
    $self->paragraph("<a href=\"" . $href . "\">" . $caption . "</a>");
}

sub mailto {
    my $self = shift;
    my ($mailaddr, $username) = @_;
    $self->link("mailto:" . $mailaddr, $username);
}

sub close {
    my $self = shift;
    my $fh = $self->{writer};
    print $fh "</body>";
    print $fh "</html>\n";
    close($self->{writer});
}

1;
		     
