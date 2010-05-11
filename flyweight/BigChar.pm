package BigChar;
use strict;
use warnings;

sub new {
    my $class = shift;
    my ($charname) = @_;

    open my $fh, '<', "./data/big$charname.txt";
    
    my $fontdata = '';
    while(my $line = <$fh>) {
	chomp($line);
	my $buf = '';
	while($line =~ /(\.|\#)(\d+)/g) {
	    my $char = $1;
	    my $num = $2;
	    $buf .= $char x $num;
	}
	$fontdata .= $buf . "\n";
    }
    close($fh);

    bless { fontdata => $fontdata, charname => $charname }, $class;
}


sub print {
    my $self = shift;
    print $self->{fontdata};
}


1;
