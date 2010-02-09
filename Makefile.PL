use inc::Module::Install 0.91;

name 'Catalyst-Model-Adaptor';
all_from 'lib/Catalyst/Model/Adaptor.pm';

requires 'MRO::Compat';
requires 'Catalyst::Runtime';

build_requires 'Test::More';
build_requires 'ok';

repository 'http://github.com/jrockway/catalyst-model-adaptor';

WriteAll();
