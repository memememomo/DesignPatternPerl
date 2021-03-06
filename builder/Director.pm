package Director;
use strict;
use warnings;

sub new {
    my $class = shift;
    my ($builder) = @_;
    bless {builder => $builder} , $class;
}

sub construct {
    my $self = shift;
    $self->{builder}->make_title("Greeting");
    $self->{builder}->make_string("朝から昼にかけて");
    $self->{builder}->make_items("おはようございます","こんにちは");
    $self->{builder}->make_string("夜に");
    $self->{builder}->make_items("こんばんは。","おやすみなさい。","さようなら");
    $self->{builder}->close();
}

1;
