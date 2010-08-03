package PrinterProxy;
use Any::Moose;
with 'Printable';

use Printer;


has name => (
    is  => 'rw',
    isa => 'Str',
    );


has real => (
    is  => 'rw',
    isa => 'Printer',
    );


sub BUILDARGS {
    my ($class, $name) = @_;
    return { name => $name };
}


sub set_printer_name {
    my ($self, $name) = @_;
    if ($self->real) {
	$self->real->set_printer_name($name);
    }
    $self->name($name);
}


sub get_printer_name { shift->name }


sub print {
    my ($self, $string) = @_;
    $self->realize();
    $self->real->print($string);
}


sub realize {
    my $self = shift;
    unless ($self->real) {
	$self->real(Printer->new($self->name));
    }
}


1;
