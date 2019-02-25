# quiz_ec.pl - Extra credit
use strict;
use warnings;

while(<STDIN>) {
    chomp();

    print "$_\n" if($_ =~ /^[^AEIOUY]{6,}.+/g);
}