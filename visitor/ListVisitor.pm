package ListVisitor;
use strict;
use warnings;
use base qw/Visitor/;

sub visit {
    my $self = shift;
    my ($arg) = @_;

    $self->{currentdir} ||= '';

    if (ref($arg) eq 'File') {
	print $self->{currentdir} . "/" . $arg->to_string(), "\n";
    } elsif (ref($arg) eq 'Directory') {
	print $self->{currentdir} . "/" . $arg->to_string(), "\n";
	my $savedir = $self->{currentdir};
	$self->{currentdir} = $self->{currentdir} . "/" . $arg->get_name();
	my $it = $arg->iterator();
	for my $entry (@$it) {
	    $entry->accept($self);
	}
	$self->{currentdir} = $savedir;
    }
}

1;
