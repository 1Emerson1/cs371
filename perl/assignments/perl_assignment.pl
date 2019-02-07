# perl-assignment.pl

# Exercise 1 using hash
# while($word = <STDIN>) {
#     chomp($word);
#     $length = length($word);

#     $occurrence{$length}++;
# }

# print "\nWord length \t\t Occurrences \n";

# for(my $i = 1; $i <= (keys %occurrence)+1; $i++) {
#     if(not exists $occurrence{$i}) {
#         print "$i \t\t\t 0 \n";
#     } else {
#         print "$i \t\t\t $occurrence{$i} \n";
#     }
# }

# Problem 2 - print uppercased words
while($word = <STDIN>) {
    chomp($word);

    print "$word\n" if $word =~ /^[A-Z]+$/;
}

# Problem 3 - correcting delimiter
# while($line = <STDIN>) {
#     chomp($line);

#     $line =~ s/\s*,\s*/, /g;
#     print "$line\n";
# }

