use inc::Module::Install;

name 'Catalyst-Model-Adaptor';
all_from 'lib/Catalyst/Model/Adaptor.pm';

requires 'Class::C3';

build_requires 'Catalyst::Runtime';
build_requires 'Test::WWW::Mechanize::Catalyst';
build_requires 'Test::More';
build_requires 'ok';

WriteAll();
