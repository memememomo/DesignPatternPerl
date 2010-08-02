package main;
use strict;
use warnings;
use NoSupport;
use LimitSupport;
use OddSupport;
use SpecialSupport;
use Trouble;

my $alice = NoSupport->new("Alice");
my $bob = LimitSupport->new("Bob", 100);
my $charlie = SpecialSupport->new("Charlie", 429);
my $diana = LimitSupport->new("Diana", 200);
my $elmo = OddSupport->new("Elmo");
my $fred = LimitSupport->new("Fred", 300);

$alice
    ->set_next($bob)
    ->set_next($charlie)
    ->set_next($diana)
    ->set_next($elmo)
    ->set_next($fred);

for (my $i = 0; $i < 500; $i += 33) {
    $alice->support(Trouble->new($i));
}
