package main;
use strict;
use warnings;
use Framework::Manager;
use UnderlinePen;
use MessageBox;

my $manager = Framework::Manager->new();
my $upen = UnderlinePen->new('~');
my $mbox = MessageBox->new('*');
my $sbox = MessageBox->new('/');
$manager->register("strong message", $upen);
$manager->register("warning box", $mbox);
$manager->register("slash box", $sbox);


my $p1 = $manager->create("strong message");
$p1->use("Hello, world.");
my $p2 = $manager->create("warning box");
$p2->use("Hello, world.");
my $p3 = $manager->create("slash box");
$p3->use("Hello, world.");
