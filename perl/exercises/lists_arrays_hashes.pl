# lists_arrays_hashes.pl 

my @days = qw(Mon Tue Wed Thu Fri Sat Sun);
my @longweekend = @days[ 4..6 ];
    # Note use of @ instead of $ before days.
print "@longweekend\n";
    # Output: Fri Sat Sun


my @count = ( 1..5 );

foreach $each ( reverse( @count ) ) {
    print "$each...\n";
    # sleep 1;
}

my @unsorted = qw( Cohen Clapton Costello Rush ZZTop );
my @sorted = sort @unsorted; # sort(@unsorted) is the same

foreach $each (@sorted) {
    print "$each\n";
}


my $hand;
my @pile = ( "letter", "newspaper", "bill", "notepad" );
print "You pick up something off the top of the pile.\n";
$hand = pop @pile;
    # "notepad" is removed from end (top) of @pile
print "You now have a $hand in your hand,\n \
and the pile contains:\n@pile";

print "You now put something on your pile.\n";
push @pile, "statement";
    # "statement" is added to the end (top) of @pile
print "Now the pile contains:\n@pile\n";

my @array = (); # nothing in array
unshift @array, "first";
print "Array is now: @array\n";
unshift @array, "second", "third";
print "Array is now: @array\n";
shift @array;
print "Array is now: @array\n";
# //unshift// adds elements, //shift// deletes elements

 my %where = (
        Gary => "Piscataway",
        Lucy => "Hackensack",
        Ian  => "Mahwah",
        Samantha => "Hoboken"
    );

 # use 'keys' function to iterate through hash keys
foreach $who ( keys %where ) {
    print "$who lives in $where{$who}\n";
}

 # use 'values' function to iterate through hash values
foreach $town ( values %where ) {
    print "someone lives in $town\n";
}

# use 'each' function to iterate through hash key/value pairs
my ($name, $town);
    # an assignable list of variables
while ( ($name, $town) = each %where ) {
    print "$name lives in $town\n";
}

print "Gary exists in the hash!\n" if exists $where{Gary};