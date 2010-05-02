package Printer;
use strict;
use warnings;

sub new {
    my $class = shift;
    my ($name) = @_;
    my $self = bless {name => $name}, $class;
    if ($self->{name}) {
	$self->heavy_job('Printerのインスタンス($self->{name})を生成中');
    } else {
	$self->heavy_job('Printerのインスタンスを生成中');
    }
    $self;
}

sub set_printer_name {
    my ($self, $name) = @_;
    $self->{name} = $name;
}

sub get_printer_name {
    my $self = shift;
    return $self->{name};
}

sub print {
    my ($self, $string) = @_;
    print "=== " . $self->{name} . " ===\n";
    print $string, "\n";
}

sub heavy_job {
    my ($self, $msg) = @_;
    print "$msg\n";
    $| = 1;
    for (my $i = 0; $i < 5; $i++) {
	sleep(1);
	print ".";
    }
    print "完了。\n";
}

1;
