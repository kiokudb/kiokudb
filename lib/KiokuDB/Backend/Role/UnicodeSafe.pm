package KiokuDB::Backend::Role::UnicodeSafe;
use Moose::Role;
# ABSTRACT: An informational role for binary data safe backends.

use namespace::clean -except => 'meta';

# informative

__PACKAGE__

__END__

=pod

=head1 SYNOPSIS

    package KiokuDB::Backend::MySpecialBackend;
    use Moose;

    use namespace::clean -except => 'meta';

    with qw(KiokuDB::Backend::Role::UnicodeSafe);

=head1 DESCRIPTION

This backend role is an informational role for backends which can
store Unicode perl strings safely.

This means that B<character> strings inserted to the database will not be
retrieved as B<byte> strings upon deserialization.

This mostly has to do with L<KiokuDB::Backend::Serialize> variants.

=cut
