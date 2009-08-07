use inc::Module::Install;

name 'Catalyst-Model-Adaptor';
all_from 'lib/Catalyst/Model/Adaptor.pm';

requires 'MRO::Compat';

build_requires 'Catalyst::Runtime';
build_requires 'Test::More';
build_requires 'ok';

WriteAll();
