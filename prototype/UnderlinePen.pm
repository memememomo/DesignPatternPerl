package UnderlinePen;
use strict;
use warnings;
use base qw/Framework::Product/;


sub new {
    my $class = shift;
    my ($ulchar) = @_;
    my $self = $class->SUPER::new();
    $self->{ulchar} = $ulchar;
    $self;
}

sub use {
    my $self = shift;
    my ($s) = @_;

    my $length = length $s;
    print "\"" . $s . "\"\n";
    print " ";
    for (my $i = 0; $i < $length; $i++) {
	print $self->{ulchar};
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
