package Pagemaker::Database;
use Any::Moose;


sub get_properties {
    my ($dbname) = @_;

    my $filename = $dbname . ".txt";
    open my $fh, '<', $filename or die "Can't open \"$filename\": $!";
    my $data = join('',<$fh>);
    close($fh);
    
    my @pair = split(/\n/,$data);
    my %prop;
    for my $p (@pair) {
	my ($mail, $name) = split(/=/,$p);
	$prop{$mail} = $name;
    }

    return %prop;
}

1;

    
