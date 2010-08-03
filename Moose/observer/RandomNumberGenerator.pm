package RandomNumberGenerator;
use Any::Moose;
with 'NumberGenerator';


has number => (
    is  => 'rw',
    isa => 'Int',
    );


sub get_number { shift->number }


sub execute {
    my $self = shift;
    for my $i (0..19) {
	$self->number(int(rand(50)));
	$self->notify_observers();
    }
}


1;
