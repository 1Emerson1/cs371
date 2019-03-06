# perlex7.pl - Extract data from HTML

open FILE, "<index.html";
$news = do {local $/; <FILE> };

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