# perlex7_usewebmod.pl - Extract data from HTML

use WWW::Mechanize;

my $mech = WWW::Mechanize->new();
my $url = "http://www.monmouth.edu/department-of-csse/news-events/";

# Read web page into $news with the get method:
$mech->get($url);
$news = $mech->content();

# Read all the headline sinto @headlines:
@headlines = $news =~ /<strong>(.+)<\/strong>/g;
    # Need the use () to exclude <strong> tags in the match

# foreach my $h1 (@headlines) {
#     print "$h1\n";
# }

@anchors = $news =~ /<a class="anchorMargin" name="(.+)">/g;

foreach my $a (@anchors) {
    print "$a\n";
}

print "There are ", $#anames + 1, " anchor names.\n";