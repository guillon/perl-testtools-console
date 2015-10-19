package TestTools::Console::TermReadLine;
use strict;
use warnings;
use Class::Interface;
&implements('TestTools::Console::ReadLineIF');

use Term::ReadLine;

my %defaults = (
    prompt => '> '
    );

sub New
{
    my ($this, %params) = @_;

    my %obj_hash;
    foreach my $field (keys %defaults)
    {
        $obj_hash{$field} = $params{$field} // $defaults{$field};
    }
    $obj_hash{'term_impl'}  = Term::ReadLine->new('Test for ReadlineIF'); 
    my $class = ref($this) || $this;
    my $self = bless \%obj_hash => $class;
    return $self;
}

sub ReadLine
{
    my ($this, $prompt) = @_;
    $prompt = $prompt // $this->{'prompt'};
    return $this->{'term_impl'}->readline($prompt);
}

sub Out
{
    my ($this) = @_;
    return $this->{'term_impl'}->OUT;
}

sub In
{
    my ($this) = @_;
    return $this->{'term_impl'}->IN;
}

1;
