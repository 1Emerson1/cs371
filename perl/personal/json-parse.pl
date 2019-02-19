# json-parse.pl - JSON Parsing Script

open FILE, "< response.json";
$json = do { local $/;<FILE> };

$json =~ s/\\u\d+[a-z]//g;
$json =~ s/\\r\\n//g;
$json =~ s/\\//g;

@content = $json =~ /<p>(.+)<\/p>?/g;


foreach my $
