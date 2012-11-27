package KiokuDB::Meta::Attribute::SetOnSave;
use Moose::Role;

use namespace::clean -except => 'meta';

sub Moose::Meta::Attribute::Custom::Trait::KiokuDB::SetOnSave::register_implementation { __PACKAGE__ }

has 'setonsave' => (
    is        => 'rw',
    isa       => 'CodeRef',
    required  => 1,
);

1;

__END__

=pod

=head1 NAME

KiokuDB::Meta::Attribute::SetOnSave - Trait for automatically updating attributes before collapsing

=head1 SYNOPSIS

    # in your class:

    package Foo;
    use Moose;
    use Class::Date 'now';

    has bar => (
        traits    => [qw(KiokuDB::SetOnSave)],
        isa       => "Class::Date",
        is        => "ro",
        setonsave => sub { now }
    );

=head1 DESCRIPTION

This L<Moose::Meta::Attribute> trait tells L<KiokuDB> to update an attribute before collapsing.

=head1 ATTRIBUTES

=over 4

=item setonsave

A method which will be invoked just before the object is collapsed. setonsave is invoked with
the object as it's first parameter and the attribute is updated with the return value, similarly
to default and builder methods. 

=cut