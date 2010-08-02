package Support;
use Any::Moose;
use Support;


has name => (
    is  => 'rw',
    isa => 'Str',
    );


has next => (
    is  => 'rw',
    isa => 'Support',
    );


sub BUILDARGS {
    my ($self, $name) = @_;

    if ($name) {
	return { name => $name };
    }

    return {};
}


sub set_next {
    my $self = shift;
    my ($next) = @_;
    $self->next($next);
    return $next;
}


sub support {
    my $self = shift;
    my ($trouble) = @_;

    if ($self->resolve($trouble)) {
	$self->done($trouble);
    } elsif ($self->next) {
	$self->next->support($trouble);
    } else {
	$self->fail($trouble);
    }
}


sub done {
    my $self = shift;
    my ($trouble) = @_;
    print $trouble->to_string() . " is resolved by " . $self->to_string() . ".\n";
}


sub fail {
    my $self = shift;
    my ($trouble) = @_;
    print $trouble->to_string() . " cannot be resolved.\n";
}


sub to_string {
    my $self = shift;
    return "[" . $self->name . "]";
}

1;
