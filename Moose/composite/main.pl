use strict;
use warnings;

use FindBin;
use lib $FindBin::Bin . "/lib";

use Entry::File;
use Entry::Directory;


print "Making root entries...\n";
my $rootdir = Entry::Directory->new("root");
my $bindir = Entry::Directory->new("bin");
my $tmpdir = Entry::Directory->new("tmp");
my $usrdir = Entry::Directory->new("usr");
$rootdir->add($bindir);
$rootdir->add($tmpdir);
$rootdir->add($usrdir);
$bindir->add(Entry::File->new("vi", 10000));
$bindir->add(Entry::File->new("latex", 20000));
$rootdir->print_list();

print "\n";
print "Making user entries...\n";
my $yuki = Entry::Directory->new("yuki");
my $hanako = Entry::Directory->new("hanako");
my $tomura = Entry::Directory->new("tomura");
$usrdir->add($yuki);
$usrdir->add($hanako);
$usrdir->add($tomura);
$yuki->add(Entry::File->new("diary.html", 100));
$yuki->add(Entry::File->new("Composite.java", 200));
$hanako->add(Entry::File->new("memo.tex", 300));
$tomura->add(Entry::File->new("game.doc", 400));
$tomura->add(Entry::File->new("junk.mail", 500));
$rootdir->print_list();


