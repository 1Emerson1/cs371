# quiz_p4.pl - Problem 4

my @upcase;
while(<STDIN>) {
    push @upcase, $_ if($_ =~ /^(?=[^AEIOU])(?=[^a-z]).+/g);
}

print @upcase;