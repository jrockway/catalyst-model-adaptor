package TestApp::Backend::SomeClass;
use strict;
use warnings;

my $id = 0;

sub new {
    my ($class, $args) = @_;
    $id++;
    return bless {%$args, count => 0}, $class;
}

sub count {
    my $self = shift;
    return $self->{count}++;
}

sub id { 
    return $id;
}

sub foo { 
    return shift->{foo};
}

1;
