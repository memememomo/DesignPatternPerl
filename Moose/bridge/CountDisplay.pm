package CountDisplay;
use Any::Moose;
extends 'Display';


sub BUILDARGS {
    my ($self, $impl) = @_;
    
    if ($impl) {
	return { impl => $impl };
    } 

    return {};
}


sub multi_display {
    my $self = shift;
    my ($times) = @_;

    $self->open();
    for (my $i = 0; $i < $times; $i++) {
	$self->print();
    }
    $self->close();
}


1;
