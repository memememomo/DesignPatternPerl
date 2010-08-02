package PrintBanner;
use Any::Moose;
use Any::Moose '::Util::TypeConstraints';
with 'Print';

use Banner;

sub BUILDARGS {
    my ($self, $string) = @_;

    if ($string) {
	return { banner => $string };
    }

    return {};
};

coerce 'Banner'
    => from 'Str',
    => via { Banner->new($_) }
;


has 'banner' => (
    is     => 'rw',
    isa    => 'Banner',
    coerce => 1,
    );

sub print_weak {
    my $self = shift;
    $self->banner->show_with_paren();
}

sub print_strong {
    my $self = shift;
    $self->banner->show_with_aster();
}

1;
