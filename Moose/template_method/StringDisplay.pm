package StringDisplay;
use Any::Moose;
extends 'AbstractDisplay';


has string => (
    is  => 'rw',
    isa => 'Str',
    );


has width => (
    is  => 'rw',
    isa => 'Int',
    );


sub BUILDARGS {
    my ($class, $string) = @_;
    my $width = length $string;
    return { string => $string, width => $width };
}


sub open {
    my $self = shift;
    $self->print_line();
}


sub print {
    my $self = shift;
    print '|' . $self->string . '|' . "\n";
}


sub close {
    my $self = shift;
    $self->print_line();
}


sub print_line {
    my $self = shift;

    print "+";
    my $w = $self->width - 1;
    for my $i (0..$w) {
	print '-';
    }
    print "+\n";
}


1;
