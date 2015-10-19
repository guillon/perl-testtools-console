use strict;
use warnings;
use Test::More;
use Test::Exception;

BEGIN { use_ok "TestTools::Console::TestFixedReadLine"; }

my $console = TestTools::Console::TestFixedReadLine->New(
    output => [
        'output1',
        '',
        'output2',
    ],
    silent => 1,
    );

is($console->Out(), \*STDOUT, "output is stdout");
is($console->In(), \*STDIN, "input is stdin");
is($console->ReadLine('prompt for output1 > '), 'output1', "output1 read");
is($console->ReadLine('prompt for enter...'), '', "enter read");
is($console->ReadLine('prompt for output2 > '), 'output2', "output2 read");

done_testing();
