package TestApp::Backend::SomeClass;
use strict;
use warnings;

sub new {
    my ($class, $args) = @_;
    return bless $args, $class;
}

sub count {
    my $self = shift;
    return $self->{count}++;
}

sub id { 
    return "$_[0]"
}

sub foo { 
    return shift->{foo}
}

1;
