package Printer;
use Any::Moose;


has name => (
    is  => 'rw',
    isa => 'Str',
    );


sub BUILDARGS {
    my ($class, $name) = @_;
    
    return { name => $name };
}


sub BUILD {
    my $self = shift;

    if ($self->name) {
	$self->heavy_job('Printerのインスタンス('.$self->name.')を生成中');
    } else {
	$self->heavy_job('Printerのインスタンスを生成中');
    }
    $self;
};


sub set_printer_name {
    my ($self, $name) = @_;
    $self->name($name);
}


sub get_printer_name { shift->name }


sub print {
    my ($self, $string) = @_;
    print "=== " . $self->name . " ===\n";
    print $string, "\n";
}


sub heavy_job {
    my ($self, $msg) = @_;
    print "$msg\n";
    $| = 1;
    for my $i (0..4) {
	sleep(1);
	print ".";
    }
    print "完了。\n";
}


1;
