package MessageBox;
use strict;
use warnings;
use base qw/Framework::Product/;
use Framework::Manager;


sub new {
    my $class = shift;
    my ($decochar) = @_;
    my $self = $class->SUPER::new();
    $self->{decochar} = $decochar;
    $self;
}

sub use {
    my $self = shift;
    my ($s) = @_;

    my $length = length $s;
    for (my $i = 0; $i < $length + 4; $i++) {
	print $self->{decochar};
    }
    print "\n";
    print $self->{decochar} . " " . $s . " " . $self->{decochar},"\n";
    for (my $i = 0; $i < $length + 4; $i++) {
	print $self->{decochar};
    }
    print "\n";
}

sub create_clone {
    my $self = shift;
    
    my $p;
    eval {
	$p = $self->clone();
    };
    if ($@) {
	die $@;
    }

    return $p;
}

1;
