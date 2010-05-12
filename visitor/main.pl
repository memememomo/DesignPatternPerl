package main;
use strict;
use warnings;
use File;
use Directory;
use ListVisitor;

print "Making root entries...\n";
my $rootdir = Directory->new("root");
my $bindir = Directory->new("bin");
my $tmpdir = Directory->new("tmp");
my $usrdir = Directory->new("usr");
$rootdir->add($bindir);
$rootdir->add($tmpdir);
$rootdir->add($usrdir);
$bindir->add(File->new("vi", 10000));
$bindir->add(File->new("latex", 20000));
$rootdir->accept(ListVisitor->new());

print "\n";
print "Making user entries...\n";
my $yuki = Directory->new("yuki");
my $hanako = Directory->new("hanako");
my $tomura = Directory->new("tomura");
$usrdir->add($yuki);
$usrdir->add($hanako);
$usrdir->add($tomura);
$yuki->add(File->new("diary.html", 100));
$yuki->add(File->new("Composite.java", 200));
$hanako->add(File->new("memo.tex", 300));
$tomura->add(File->new("game.doc", 400));
$tomura->add(File->new("junk.mail", 500));
$rootdir->accept(ListVisitor->new());


