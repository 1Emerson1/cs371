# mechanize_webadvisor.pl - Try WWW:Mechanize with webadvisor.
use WWW::Mechanize;

$url = "https://www2.monmouth.edu/muwebadv/wa3/search/SearchClassesV2.aspx";
my $mech = WWW::Mechanize->new();

$mech->get($url);

# Select the term.
$term = "19/SP - 2019 Spring";
$mech->field("_ctl0:MainContent:dd1Term", $term);

# Click the Submit button
$mech->click_button(name => "_ctl0:MainContent:btnSubmit");

# Get resulting HTML from clicking submit.
my $page = $mech->content();

print $page;