use strictures;

package Perl::Patterns::Schema::Result::Element;
use parent qw/DBIx::Class::Core/;

__PACKAGE__->table( 'element' );
__PACKAGE__->add_columns(
    element_id    => { data_type => 'integer', is_auto_increment => 1 },
    raw_source_id => {},
);
__PACKAGE__->set_primary_key( 'element_id' );
__PACKAGE__->has_one( raw_source => 'Perl::Patterns::Schema::Result::RawSource', 'raw_source_id' );

1;
