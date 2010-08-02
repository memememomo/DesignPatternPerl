package TextBuilder;
use Any::Moose;
with 'Builder';


has buffer => (
    is  => 'rw',
    isa => 'Str',
    );


sub make_title {
    my $self = shift;
    my ($title) = @_;

    my $buf = $self->buffer;
    $buf .= "====================================\n";
    $buf .= " 『" . $title . "』 \n";
    $buf .= "\n";

    $self->buffer($buf);
}


sub make_string {
    my $self = shift;
    my ($str) = @_;

    my $buf = $self->buffer;
    $buf .= "■" . $str . "\n";
    $buf .= "\n";

    $self->buffer($buf);
}


sub make_items {
    my $self = shift;
    my @items = @_;

    my $buf = $self->buffer;
    for my $item (@items) {
	$buf .= " ・" . $item . "\n";
    }
    $buf .= "\n";
    
    $self->buffer($buf);
}


sub close {
    my $self = shift;
    $self->buffer($self->buffer."====================================\n");
}


sub get_result {
    my $self = shift;
    return $self->buffer;
}


1;
