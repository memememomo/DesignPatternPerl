package Game::Gamer;
use Any::Moose;

use utf8;


has money => (
    is  => 'rw',
    isa => 'Int',
    );


has fruits => (
    is      => 'rw',
    isa     => 'ArrayRef',
    lazy    => 1,
    default => sub {[]},
    );


has fruitsname => (
    is  => 'ro',
    isa => 'ArrayRef',
    default => sub { ["りんご", "ぶどう", "バナナ", "みかん"] },
    );


sub BUILDARGS {
    my ($class, $money) = @_;
    return { money => $money };
}


sub get_money { shift->money }


sub bet {
    my $self = shift;

    my $dice = int(rand(6)) + 1;
    if ($dice == 1) {
	$self->{money} += 100;
	print "所持金が増えました。\n";
    } elsif ($dice == 2) {
	$self->{money} = int($self->money / 2);
	print "所持金が半分になりました。\n";
    } elsif ($dice == 6) {
	my $f = $self->get_fruit();
	print "フルーツ(" . $f . ")をもらいました。\n";
	push @{$self->fruits}, $f;
    } else {
	print "何も起こりませんでした。\n";
    }
}


sub create_memento {
    my $self = shift;

    my $m = Game::Memento->new($self->money);

    for my $f (@{$self->fruits}) {
	if ($f =~ /^おいしい/) {
	    $m->add_fruit($f);
	}
    }
    return $m;
}


sub restore_memento {
    my ($self, $memento) = @_;
    $self->money($memento->money);
    $self->fruits([$memento->get_fruits()]);
}


sub to_string {
    my $self = shift;
    return "[money = " . $self->money . ", fruits = " . join(',',@{$self->fruits}) . "]";
}


sub get_fruit {
    my $self = shift;
    my $prefix = "";
    if (int(rand(100000))%2 == 0) {
	$prefix = "おいしい";
    }
    my $length = @{$self->fruitsname};
    return $prefix . $self->fruitsname->[int(rand($length))];
}


1;

