package ListVisitor;
use Any::Moose;
with 'Visitor';


has currentdir => (
    is      => 'rw',
    isa     => 'Str',
    default => '',
    );


sub visit {
    my ($self, $arg) = @_;

    if (ref($arg) eq 'File') {
	print $self->currentdir . "/" . $arg->to_string() . "\n";
    } elsif (ref($arg) eq 'Directory') {
	print $self->currentdir . "/" . $arg->to_string() . "\n";
	my $savedir = $self->currentdir;
	$self->currentdir($self->currentdir . "/" . $arg->get_name());
	my $it = $arg->iterator();
	for my $entry (@$it) {
	    $entry->accept($self);
	}
	$self->{currentdir} = $savedir;
    }
}


1;
