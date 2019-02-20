# json-parse.pl - JSON Parsing Script
use strict;
use warnings;
use open ':std', ':encoding(UTF-8)';

# CPAN addon
use JSON qw( decode_json );

open FILE, "< response.json";
my $json = do { local $/;<FILE> };

my $decoded = decode_json($json);
my $content = $decoded->{'content'};

my $clean_html = $content;

# stores image source into array
my @img = $clean_html =~ /<img.+src="(.+)"\salt.+\/>/g;

# remove any image tags
$content =~ s/<img.+src=".+"\salt.+\s\/>//g;
# remove any space characters
$content =~ s/&nbsp;//g;

my @article = $content =~ /<p>(.+)<\/p>/g;

print "@img\n";

print "@article\n";