package TestTools::Console::TestFixedReadLine;
use strict;
use warnings;
use Class::Interface;
&implements('TestTools::Console::ReadLineIF');

use Term::ReadLine;

my %defaults = (
    output => [],
    output_idx => 0,
    silent => 0,
    out => \*STDOUT,
    in => \*STDIN,
    );

sub New
{
    my ($this, %params) = @_;

    my %obj_hash;
    foreach my $field (keys %defaults)
    {
        $obj_hash{$field} = $params{$field} // $defaults{$field};
    }
    my $class = ref($this) || $this;
    my $self = bless \%obj_hash => $class;
    return $self;
}

sub ReadLine
{
    my ($this, $prompt) = @_;
    my $OUT = $this->Out();
    print $OUT $prompt unless $this->{'silent'};
    my $str = '';
    if ($this->{'output_idx'} < scalar($this->{'output'}))
    {
        $str = $this->{'output'}->[$this->{'output_idx'}];
        $this->{'output_idx'} += 1;
    }
    print $OUT "$str\n" unless $this->{'silent'};
    return $str;
}

sub Out
{
    my ($this) = @_;
    return $this->{'out'};
}

sub In
{
    my ($this) = @_;
    return $this->{'in'};
}

1;
