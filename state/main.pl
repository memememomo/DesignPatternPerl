use strict;
use warnings;

use FindBin;
use lib $FindBin::Bin . "/lib";

use Context::Safe;


my $safe = Context::Safe->new;
while (1) {
    for my $hour (0..23) {
	$safe->set_clock($hour);
	$safe->action_performed("buttonUse");
	$safe->action_performed("buttonAlarm");
	$safe->action_performed("buttonPhone");
	sleep(1);
    }
}

