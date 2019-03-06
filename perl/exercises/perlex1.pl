# perlex1.pl - count word lengths in english.sorted

# 1 - Read each line from standard input (< english.sorted)
while($word = <STDIN>) {
    # 2 - Get length of each word that we read. Remove 
    $length = length($word) - 1;
    # alternatively, could have done this: $length = length(chomp($word);
    
    # 3 - Increment correct word length array element using $length.
    $wordlengths[$length]++; # @wordlengths array being created "on-the-fly".
}

print "Word length \t\t Occurrences \n\n";

for(my $i = 1; $i <= $#wordlengths; $i++) {
    if(not exists $wordlengths[$i]) {
        print "$i \t\t\t 0 \n"; # because there are no 26-char words in english.sorted
    } else {
        print "$i \t\t\t $wordlengths[$i] \n";
    }
}

# creating arrays on the fly is convinence but has some problems