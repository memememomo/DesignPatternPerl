package PrinterProxy;
use strict;
use warnings;
use base qw/Printable/;
use Printer;

sub new {
    my $class = shift;
    my ($name) = @_;
    bless {name => $name}, $class;
}

sub set_printer_name {
    my ($self, $name) = @_;
    if ($self->{real}) {
	$self->{real}->set_printer_name($name);
    }
    $self->{name} = $name;
}

sub get_printer_name {
    my $self = shift;
    return $self->{name};
}

sub print {
    my ($self, $string) = @_;
    $self->realize();
    $self->{real}->print($string);
}

sub realize {
    my $self = shift;
    unless ($self->{real}) {
	$self->{real} = Printer->new($self->{name});
    }
}

1;
