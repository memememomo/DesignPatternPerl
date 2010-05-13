package main;
use strict;
use warnings;
use IDCardFactory;

my $factory = IDCardFactory->new();
my $card1 = $factory->create("結城浩");
my $card2 = $factory->create("とむら");
my $card3 = $factory->create("佐藤花子");
$card1->use();
$card2->use();
$card3->use();


