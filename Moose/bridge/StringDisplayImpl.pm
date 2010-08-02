package StringDisplayImpl;
use Any::Moose;
with 'DisplayImpl';

has string => (
    is  => 'rw',
    isa => 'Str',
    );

has width => (
    is  => 'rw',
    isa => 'Int',
    );

sub BUILDARGS {
    my ($self, $string) = @_;
    
    if ($string) {
	my $width = length $string;
	return { string => $string, width => $width };
    }

    return {};
}


sub raw_open {
    my $self = shift;
    $self->print_line();
}


sub raw_print {
    my $self = shift;
    print "|" . $self->string . "|" . "\n";
}


sub raw_close {
    my $self = shift;
    $self->print_line();
}


sub print_line {
    my $self = shift;
    print "+";
    my $w = $self->width;
    for (my $i = 0; $i < $w; $i++) {
	print "-";
    }
    print "+\n";
}


1;

