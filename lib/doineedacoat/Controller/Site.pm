package doineedacoat::Controller::Site;
use Moose;
use namespace::autoclean;
use Data::Dumper;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

doineedacoat::Controller::Site - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


#=head2 index

#=cut

#sub index :Path :Args(0) {
    #my ( $self, $c ) = @_;

    #$c->response->body('Matched doineedacoat::Controller::Site in Site.');
#}




=head1 AUTHOR

Weedom,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
