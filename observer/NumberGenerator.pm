package NumberGenerator;
use strict;
use warnings;

sub new {
    my $class = shift;
    bless {observers => []}, $class;
}

sub add_observer {
    my $self = shift;
    my ($observer) = @_;
    push @{$self->{observers}}, $observer;
}

sub delete_observer {
    my $self = shift;
    my ($observer) = @_;

    my @observers = @{$self->{observers}};
    for (my $i = 0; $i <= $#observers; $i++) {
	if ($observers[$i] eq $observer) {
	    splice( @observers, $i );
	    last;
	}
    }

    $self->{observers} = \@observers;
}

sub notify_observers {
    my $self = shift;

    for my $ob (@{$self->{observers}}) {
	$ob->update($self);
    }
}

sub get_number { die "get_number() is abstract." }
sub execute    { die "execute() is abstract." } 

1;
