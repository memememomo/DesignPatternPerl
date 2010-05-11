package main;
use strict;
use warnings;
use Player;
use WinningStrategy;
use ProbStrategy;

my $player1 = Player->new("Taro", WinningStrategy->new());
my $player2 = Player->new("Hana", ProbStrategy->new());

for (my $i = 0; $i < 10000; $i++) {
    my $next_hand1 = $player1->next_hand();
    my $next_hand2 = $player2->next_hand();

    if ($next_hand1->is_stronger_than($next_hand2)) {
	print "Winner:" , $player1->to_string() , "\n";
	$player1->win();
	$player2->lose();
    } elsif ($next_hand2->is_stronger_than($next_hand1)) {
	print "Winner:" , $player2->to_string() , "\n";
	$player1->lose();
	$player2->win();
    } else {
	print "Even...\n";
	$player1->even();
	$player2->even();
    }

}

print "Total result:\n";
print $player1->to_string() , "\n";
print $player2->to_string() , "\n";
