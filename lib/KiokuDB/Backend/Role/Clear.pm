package KiokuDB::Backend::Role::Clear;
use Moose::Role;
# ABSTRACT: Backend clearing API

use namespace::clean -except => 'meta';

requires "clear";

__PACKAGE__

__END__

=pod

=head1 SYNOPSIS

    package KiokuDB::Backend::MySpecialBackend;
    use Moose;

    use namespace::clean -except => 'meta';

    with qw(
        KiokuDB::Backend
        KiokuDB::Backend::Role::Clear
    );

    sub clear {
        ...
    }

=head1 DESCRIPTION

This backend role provides an API for removing all entries from a backend.

This is optionally used by the dump loader script, and parts of the test suite.

=head1 REQUIRED METHODS

=over 4

=item clear

This method should clear all entries in the backend.

=back

=cut
