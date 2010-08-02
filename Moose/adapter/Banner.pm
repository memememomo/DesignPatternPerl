package Banner;
use Any::Moose;

has 'string' => ( is => 'rw', isa => 'Str' );

sub BUILDARGS {
    my ($self, $string) = @_;

    if ($string) {
	return { string => $string };
    }

    return {};
};

sub show_with_paren {
    my $self = shift;
    print '(' . $self->string . ')'."\n";
}

sub show_with_aster {
    my $self = shift;
    print '*' . $self->string . '*'."\n";
}

1;
