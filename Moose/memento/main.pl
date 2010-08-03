package main;
use strict;
use warnings;
use Game::Memento;
use Game::Gamer;
use utf8;

binmode STDOUT, ":utf8";

my $gamer = Game::Gamer->new(100);
my $memento = $gamer->create_memento();
for (my $i = 0; $i < 100; $i++) {
    print "==== " . $i . "\n";
    print "現状:" . $gamer->to_string();

    $gamer->bet();

    print "所持金は" . $gamer->get_money() . "円になりました。\n";

    if ($gamer->get_money() > $memento->get_money()) {
	print "   (だいぶ増えたので、現在の状態を保存しておこう)\n";
	$memento = $gamer->create_memento();
    } elsif ($gamer->get_money() < $memento->get_money() / 2) {
	print "   (だいぶ減ったので、以前の状態に復帰しよう)\n";
	$gamer->restore_memento($memento);
    }

    sleep(1);
    print "\n";
}

