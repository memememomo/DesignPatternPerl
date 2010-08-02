package Director;
use Any::Moose;

use Builder;
has builder => (
    is  => 'rw',
    isa => 'Builder',
    );


sub BUILDARGS {
    my ($self, $builder) = @_;

    if ($builder) {
	return { builder => $builder };
    }

    return {};
}


sub construct {
    my $self = shift;
    $self->builder->make_title("Greeting");
    $self->builder->make_string("朝から昼にかけて");
    $self->builder->make_items("おはようございます","こんにちは");
    $self->builder->make_string("夜に");
    $self->builder->make_items("こんばんは。","おやすみなさい。","さようなら");
    $self->builder->close();
}


1;
