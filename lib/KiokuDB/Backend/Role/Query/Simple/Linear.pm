package KiokuDB::Backend::Role::Query::Simple::Linear;
use Moose::Role;
# ABSTRACT: Query::Simple implemented with a linear scan of all entries.

use namespace::clean -except => 'meta';

with qw(KiokuDB::Backend::Role::Query::Simple);

requires "root_entries";

sub simple_search {
    my ( $self, $proto ) = @_;

    # FIXME $proto is sql::abstract 2? or...?

    my $root_set = $self->root_entries;

    return $root_set->filter(sub {
        return [ grep {
            my $entry = $_;
            $self->compare_naive($entry->data, $proto);
        } @$_ ]
    });
}

__PACKAGE__

__END__

=pod

=head1 SYNOPSIS

    package MyBackend;
    use Moose;

    with qw(
        KiokuDB::Backend::Role::Scan
        KiokuDB::Backend::Role::Query::Simple::Linear
    );

=head1 DESCRIPTION

This role can provide a primitive C<search> facility (the API described in
L<KiokuDB::Backend::Role::Query::Simple>) using the API provided by
L<KiokuDB::Backend::Role::Scan>. While very inefficient for large data sets, of
your databases are small this can be useful.

=cut
