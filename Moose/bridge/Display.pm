package Display;
use Any::Moose;

use DisplayImpl;

has impl => ( is => 'rw', isa => 'DisplayImpl' );


sub BUILDARGS {
    my ($self, $impl) = @_;
    
    if ($impl) {
	return { impl => $impl };
    }

    return {};
}

sub open {
    my $self = shift;
    return $self->impl->raw_open();
}

sub print {
    my $self = shift;
    return $self->impl->raw_print();
}

sub close {
    my $self = shift;
    return $self->impl->raw_close();
}

sub display {
    my $self = shift;
    $self->open();
    $self->print();
    $self->close();
}

1;

