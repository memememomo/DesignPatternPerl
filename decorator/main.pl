package main;
use strict;
use warnings;
use StringDisplay;
use SideBorder;
use FullBorder;

my $b1 = StringDisplay->new("Hello, world.");
my $b2 = SideBorder->new($b1, '#');
my $b3 = FullBorder->new($b2);
$b1->show();
$b2->show();
$b3->show();

my $b4 =
    SideBorder->new(
	FullBorder->new(
	    FullBorder->new(
		SideBorder->new(
		    FullBorder->new(
			StringDisplay->new("こんにちは。")
		    ),
		    '*'
		    )
	    )
	),
	'/'
    );
$b4->show();
	    
