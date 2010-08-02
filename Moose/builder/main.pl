package main;
use strict;
use warnings;
use Director;
use TextBuilder;
use HTMLBuilder;


my $args = $ARGV[0] || 'plain';

if ($args eq 'plain') {
    my $textbuilder = TextBuilder->new();
    my $director = Director->new($textbuilder);
    $director->construct();
    my $result = $textbuilder->get_result();
    print $result, "\n";
} elsif ($args eq 'html') {
    my $htmlbuilder = HTMLBuilder->new();
    my $director = Director->new($htmlbuilder);
    $director->construct();
    my $filename = $htmlbuilder->get_result();
    print $filename . "が作成されました。\n";
}
