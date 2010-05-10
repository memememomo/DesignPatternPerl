package Game::Gamer;
use strict;
use warnings;
use utf8;

sub new {
    my $class = shift;
    my ($money) = @_;
    bless { money => $money,
	    fruits => [],
	    fruitsname => ["りんご", "ぶどう", "バナナ", "みかん"],
    }, $class;
}

sub get_money { shift->{money} }

sub bet {
    my $self = shift;
    
    my $dice = int(rand(6)) + 1;
    if ($dice == 1) {
	$self->{money} += 100;
	print "所持金が増えました。\n";
    } elsif ($dice == 2) {
	$self->{money} = int($self->{money} / 2);
	print "所持金が半分になりました。\n";
    } elsif ($dice == 6) {
	my $f = $self->get_fruit();
	print "フルーツ(" . $f . ")をもらいました。\n";
	push @{$self->{fruits}}, $f;
    } else {
	print "何も起こりませんでした。\n";
    }
}

sub create_memento {
    my $self = shift;

    my $m = Game::Memento->new($self->{money});

    for my $f (@{$self->{fruits}}) {
	if ($f =~ /^おいしい/) {
	    $m->add_fruit($f);
	}
    }
    return $m;
}

sub restore_memento {
    my $self = shift;
    my ($memento) = @_;
    $self->{money} = $memento->{money};
    $self->{fruits} = $memento->get_fruits();
}

sub to_string {
    my $self = shift;
    return "[money = " . $self->{money} . ", fruits = " . join(',',@{$self->{fruits}}) . "]";
}

sub get_fruit {
    my $self = shift;
    my $prefix = "";
    if (int(rand())%2 == 0) {
	$prefix = "おいしい";
    }
    my $length = @{$self->{fruitsname}};
    return $prefix . $self->{fruitsname}->[int(rand($length))];
}

1;    
