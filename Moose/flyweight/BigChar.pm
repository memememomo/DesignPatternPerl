package BigChar;
use Any::Moose;


has fontdata => (
    is  => 'rw',
    isa => 'Str',
    );


has charname => (
    is  => 'rw',
    isa => 'Str',
    );


sub BUILDARGS {
    my ($class, $charname) = @_;

    open my $fh, '<', "./data/big$charname.txt"
	or die "Can't open file: $!";
    
    my $fontdata = '';
    while (my $line = <$fh>) {
	chomp($line);
	my $buf = '';
	while ($line =~ /(\.|\#)(\d+)/g) {
	    my $char = $1;
	    my $num  = $2;
	    $buf .= $char x $num;
	}
	$fontdata .= $buf . "\n";
    }
    close($fh);

    return { fontdata => $fontdata, charname => $charname };
}


sub print { print shift->fontdata }


1;
