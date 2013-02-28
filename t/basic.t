use strictures;

package basic_test;

use Test::InDistDir;
use Test::More;
use Perl::Patterns;
use PPI::Document;
use autodie;
use Time::HiRes 'time';

run();
done_testing;
exit;

sub run {
    unlink "patterns.db" if -e "patterns.db";

    ok my $p = Perl::Patterns->new;

    my $f = PPI::Document->new( "corpus/Dispatch.pm" );

    my $t = time;
    $p->add( $f );
    diag time - $t;
    is $p->elements, 274;
    is $p->raw_sources, 274;

    return;
}
