# perlex6.pl - Read an entire file into a string var.

# Open a file
open FILE, " <roster.txt";

$roster = do { local $/;<FILE> };

# print "$roster\n";

# Read all student ids into @ids.
@ids = $roster =~ /s[0-9]{7}/g;

print "@ids\n";