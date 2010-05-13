package main;
use strict;
use warnings;
use Singleton;

print "Start.\n";
my $obj1 = Singleton::get_instance();
my $obj2 = Singleton::get_instance();

if ($obj1 eq $obj2) {
    print "obj1とobj2は同じインスタンスです。\n";
} else {
    print "obj1とobj2は同じインスタンスではありません。\n";
}

print "End.\n";
