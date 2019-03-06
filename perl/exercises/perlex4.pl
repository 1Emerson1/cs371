# perlex4.pl - roster to hash

while($studentline = <STDIN>) {
    chomp($studentline);

    ($last, $first, $studentID) = split /, /, $studentline;
        # Reading each line of class roster, only grabbing student ID
    $id = substr($studentID, 0, index($studentID, '@'));
        # Extracting student ID
    $roster{join ' ', ($first, $last)} = $id;
        # Writing into hash
}

# Print in sorted matter
foreach $name (sort keys %roster) {
    print "$name, $roster{$name}\n";
}