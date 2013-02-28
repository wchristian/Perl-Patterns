use strictures;

package Perl::Patterns;

use Moo;
use Perl::Patterns::Schema;

sub {
    has db => ( is => 'lazy' );
  }
  ->();

# VERSION

# ABSTRACT:

# COPYRIGHT

sub _build_db {
    my $s = Perl::Patterns::Schema->connect( "dbi:SQLite:dbname=patterns.db", "", "", { RaiseError => 1 } );
    $s->deploy;
    return $s;
}

sub add {
    my ( $self, $ppi ) = @_;

    my $element_sub = sub { $_[1]->isa( "PPI::Statement" ) or $_[1]->isa( "PPI::Structure" ) };
    my @elements = @{ $ppi->find( $element_sub ) };

    #my @raw_sources = map { [ $_->content ] } @elements;
    #$self->db->resultset( 'RawSource' )->populate( [ ["content"], @raw_sources ] );
    #my @raw_source_objects = $self->raw_sources;

    my @element_inserts = map { { raw_source => { content => $_->content } } } @elements;
    $self->db->resultset( 'Element' )->populate( \@element_inserts );

    return;
}

sub elements    { $_[0]->db->resultset( 'Element' )->all }
sub raw_sources { $_[0]->db->resultset( 'RawSource' )->all }

1;
