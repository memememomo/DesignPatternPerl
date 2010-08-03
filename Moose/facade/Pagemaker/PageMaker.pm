package Pagemaker::PageMaker;
use Any::Moose;

use Pagemaker::Database;
use Pagemaker::HtmlWriter;


sub make_welcome_page {
    my ($mailaddr, $filename) = @_;

    my %mailprop = Pagemaker::Database::get_properties("maildata");
    my $username = $mailprop{$mailaddr};

    open my $fh, '>', $filename or die "Can't open \"$filename\": $!";
    my $writer = Pagemaker::HtmlWriter->new($fh);
    $writer->title("Welcome to " . $username . "'s page!");
    $writer->paragraph($username . "のページへようこそ。");
    $writer->paragraph("メール待っていますね。");
    $writer->mailto($mailaddr, $username);
    $writer->close();
    print $filename . " is created for " . $mailaddr . " (" . $username . ")\n";
}


1;
