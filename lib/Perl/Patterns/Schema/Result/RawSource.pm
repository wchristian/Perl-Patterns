use strictures;

package Perl::Patterns::Schema::Result::RawSource;
use parent qw/DBIx::Class::Core/;

__PACKAGE__->table( 'raw_source' );
__PACKAGE__->add_columns(
    raw_source_id => { data_type => 'integer', is_auto_increment => 1 },
    content       => {},
);
__PACKAGE__->set_primary_key( 'raw_source_id' );

1;
