package TestApp;
use strict;
use warnings;

use Catalyst;

__PACKAGE__->config->{'Model::SomeClass'}{args} = { foo => 'bar' };
__PACKAGE__->setup;

1;
