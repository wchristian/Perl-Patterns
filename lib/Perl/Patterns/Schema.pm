use strictures;

package Perl::Patterns::Schema;
use parent qw/DBIx::Class::Schema/;
our $VERSION = 1;
__PACKAGE__->load_namespaces;

1;
