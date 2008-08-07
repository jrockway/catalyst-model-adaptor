package Catalyst::Model::Factory;
use strict;
use warnings;

use base 'Catalyst::Model::Adaptor::Base';

our $VERSION = '0.03';

sub COMPONENT {
    my ($class, @args) = @_;
    my $self = $class->next::method(@args);

    $self->_load_adapted_class;
    return $self;
}

sub ACCEPT_CONTEXT {
    my ($self, $context) = @_;
    return $self->_create_instance($context);
}

1;
__END__

=head1 NAME

Catalyst::Model::Factory - use a plain class as a Catalyst model,
instantiating it every time it is requested

=head1 SYNOPSIS

This module works just like
L<Catalyst::Model::Adaptor|Catalyst::Model::Adaptor>, except that a
fresh instance of your adapted class is created every time it is
requested via C<< $c->model >>.

=head1 CUSTOMIZING

You can customize your subclass just like
L<Catalyst::Model::Adaptor|Catalyst::Model::Adaptor>.  Instead of
C<$app>, though, you'll get C<$c>, the current request context.

=head1 METHODS

These methods are called by Catalyst, not by you:

=head2 COMPONENT

Load your class

=head2 ACCEPT_CONTEXT

Create an instance of your class and return it.

=head1 SEE ALSO

For all the critical documentation, see L<Catalyst::Model::Adaptor>.
