#!/usr/bin/env perl

use inc::Module::Install;

name 'Console';
version_from 'lib/Console.pm';
author 'Christophe Guilln <christophe.guillon@st.com';
abstract 'Console Interface Module';
license 'perl';
perl_version '5.010';

requires 'Class::Interface'  => 0;
requires 'Scalar::Util' => 0;
requires 'Time::HiRes' => 0;
requires 'Term::ReadLine' => 0;

test_requires 'Test::More' => 0;
test_requires 'Test::Exception' => 0;

WriteAll;
