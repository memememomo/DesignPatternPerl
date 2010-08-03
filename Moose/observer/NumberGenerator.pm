package NumberGenerator;
use Any::Moose '::Role';
requires qw/get_number execute/;


has observers => (
    is      => 'rw',
    isa     => 'ArrayRef',
    lazy    => 1,
    default => sub {[]},
    );


sub add_observer {
    my ($self, $observer) = @_;
    push @{$self->observers}, $observer;
}


sub delete_observer {
    my ($self, $observer) = @_;
    
    my @observers = @{$self->observers};
    for my $i (0..$#observers) {
	if ($observers[$i] eq $observer) {
	    splice( @observers, $i );
	    last;
	}
    }
}


sub notify_observers {
    my $self = shift;

    for my $ob (@{$self->observers}) {
	$ob->update($self);
    }
}


1;
