# perlex2.pl extract all words from english.sorted < 7 char or less into short.words

#$shortlen = 7;

while(<STDIN>) {
    chomp($_); # Apply chomp to Perl's default variable $_ (the current word).

    # Default variable used commonly

    # if(length($_) <= $shortlen) {
    #     print "$_ \n";
    # }

    # Regex method
    if($_ =~ /^.{1-7}$/) {
        print "$_ \n";
    }
}

