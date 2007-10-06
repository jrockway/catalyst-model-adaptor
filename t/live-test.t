#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 12;

# setup library path
use FindBin qw($Bin);
use lib "$Bin/lib";

# make sure testapp works
use ok 'TestApp';

# a live test against TestApp, the test application
use Test::WWW::Mechanize::Catalyst 'TestApp';
my $mech = Test::WWW::Mechanize::Catalyst->new;
$mech->get_ok('http://localhost/', 'get main page');
$mech->content_like(qr/it works/i, 'see if it has our text');

$mech->get_ok('http://localhost/adaptor/isa', 'get the class name');
$mech->content_like(qr/^TestApp::Backend::SomeClass$/, 'adapted class is itself');

$mech->get_ok('http://localhost/adaptor/try_twice', 'get try_twice');
{
    my ($a, $b) = split /\|/, $mech->content; 
    is $a, $b, 'same instance both times';
}

$mech->get_ok('http://localhost/adaptor/foo', 'get foo');
$mech->content_like(qr/^bar$/, 'Adapted class is itself');

{
    $mech->get_ok('http://localhost/adaptor/count', 'get count');
    my $a = $mech->content;
    $mech->get_ok('http://localhost/adaptor/count', 'get count (+1)');
    my $b = $mech->content;
    
    is $b, $a+1, 'same instance across requests';
}
