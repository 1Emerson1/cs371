# perlex5.pl - Process rosters using subroutines and command lines args.

sub help {
    # Using a Perl "heredoc":
    # multiple line string works too
    $message = <<"END_MSG";

    Usage: perl -w perlex5.pl <option> rosterfile

          where <option> is one of the following:
                -help: display this help
                -first: sort by first name
                -last: sort by last name
                -id: sort by id\n
END_MSG
    print $message;
} # end help()

# Add student to roster
# First param determines sort order.
# Input arguements: 0-sort order, 1-first name, 2-last name, 3-id
sub addstudent {
    # Get sort order from first argument in @_:
    my $sortby = $_[0];

    if($sortby =~ /-f/) {
        $student2add = "$_[1] $_[2] $_[3]"; #first last id
    } elsif ($sortby =~ /-l/) {
         $student2add = "$_[2] $_[1] $_[3]"; #last first id
    } else {
         $student2add = "$_[3] $_[2] $_[1]"; #id first last
    }

    push @roster, $student2add;
} #end addstudent()

###### End of subroutines ######

# Run help() if not enough command line args or if first arg contain -h:

$numargs = $#ARGV+1;
if($numargs < 2 || $ARGV[0] =~ /-h/) {
    help();
    exit(1); # non-zero exit status means an error
}

# Get sortby argument from first command line arg:
my $sortby = shift @ARGV;

while($studentline = <>) {
    ($last, $first, $id) = split /\s*,\s/, $studentline;
    #   \s zero or more white space characters followed by a single white space
    chomp($id); # $id field has a newline; remove it
    addstudent($sortby, $first, $last, $id);
}

foreach $student (sort @roster) {
    print "$student\n";
}