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