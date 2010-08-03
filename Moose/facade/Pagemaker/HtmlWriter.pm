package Pagemaker::HtmlWriter;
use Any::Moose;


has writer => (
    is  => 'rw',
    isa => 'FileHandle',
    );


sub BUILDARGS {
    my ($class, $writer) = @_;
    return { writer => $writer };
}


sub title {
    my ($self, $title) = @_;

    my $fh = $self->writer;
    print $fh "<html>";
    print $fh "<head>";
    print $fh "<title>" . $title . "</title>";
    print $fh "</head>";
    print $fh "<body>\n";
    print $fh "<h1>" . $title . "</h1>\n";
}


sub paragraph {
    my ($self, $msg) = @_;

    my $fh = $self->writer;
    print $fh "<p>" . $msg . "</p>\n";
}


sub link {
    my ($self, $href, $caption) = @_;
    $self->paragraph("<a href=\"" . $href . "\">" . $caption . "</a>");
}


sub mailto {
    my ($self, $mailaddr, $username) = @_;
    $self->link("mailto:" . $mailaddr, $username);
}


sub close {
    my $self = shift;
    my $fh = $self->writer;
    print $fh "</body>";
    print $fh "</html>\n";
    close($self->writer);
}


1;
