# perlex3.pl - Read and process class roster.

while($studentline = <STDIN>) {
    chomp($_);
    
    ($last, $first, $email) = split /, /, $studentline;
        # Use ", " as field delimiter to split $studentline
        # into last, first, and email fields.

    $student = "$first $last $email";

    # Add student to roster array:
    push @roster, $student;
}

# Print the roster array, sorted by first name:
foreach $student (sort @roster) {
    print $student;
}