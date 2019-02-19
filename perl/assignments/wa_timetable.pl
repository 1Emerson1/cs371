# wa_timetable.pl - Perl Project
use WWW::Mechanize;

my @terms;
my @subjects;

# subroutine
sub help {
    $message = <<"END_MSG";

    Usage: perl -w wa_timetable.pl "Term" "Subject" <option>

        where <option> is one of the following:
            -help: display a help screen and sample usage
            -terms: list all currently available Terms
            -subjects: list all currently available Subjects

    Sample usage:
           perl -w wa_timetable.pl "19/SP - 2019 Spring" "ENGLISH (EN)"\n
END_MSG
    print $message;
}# end help()

sub terms {
    # select all terms using regex
    foreach my $term (@terms) {
        print "$term\n";
    }
}# end term()

sub subjects {
    foreach my $subject (sort @subjects) {
        print "$subject\n"
    }
}# end subjects()

sub timetable {
    my $term = $_[0];
    my $subject = $_[1];

    if(grep {$_ eq $term} @terms) {
        $mech->field("_ctl0:MainContent:ddlTerm", $term);
    }

    if(length $subject) {
        if(grep {$_ eq $subject} @subjects) {
            $mech->field("_ctl0:MainContent:ddlSubj_1", $subject);
        }
    }
    
    # Click the Submit button
    $mech->click_button(name => "_ctl0:MainContent:btnSubmit");

    # Get resulting HTML from clicking submit.
    my $page = $mech->content();

    # checks returned page for valid search results
    if($page =~ />(No classes meeting the search criteria have been found.)</g) {
        print "No classes meeting the search criteria have been found.\n";
    } else {
        print $page;
    }
}

###### End of subroutines ######

$mech = WWW::Mechanize->new();

$url = "https://www2.monmouth.edu/muwebadv/wa3/search/SearchClassesV2.aspx";
$mech->get($url);
my $page = $mech->content();

# iteriate through HTML file
@terms = $page =~/<option value="19?.+\/.+">(.+)<\/option>/g;

@subjects = $page =~/<option value="[A-Z]+">(.+\s\([A-Z]{2}\))<\/option>/g; 
# removes duplicates
@subjects = keys {map {$_ => 1} @subjects};

my $numargs = $#ARGV+1;
if($numargs eq 0 || $ARGV[0] =~ /^-h/) {
    help();
    exit(1);
} elsif($ARGV[0] =~ /^-t/) {
    terms();
    exit(1);
} elsif($ARGV[0] =~ /^-s/) {
    subjects();
        exit(1);
} elsif($numargs < 5 || $numargs >= 2) {
    timetable($ARGV[0], $ARGV[1]);
}