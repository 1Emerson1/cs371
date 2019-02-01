# regexp.pl - Try regular expression matching and substitutions

$var = "Alpaugh, Weldon, s0396012\@monmouth.edu";

print "Match!\n" if $var =~ / *, */;
print "Match!\n" if $var =~ /s[0-9][0-9][0-9][0-9][0-9][0-9][0-9]/;
print "Match!\n" if $var =~ /^A/;
print "Match!\n" if $var =~ /edu$/;
    # Check if there's an "edu" at the of the string
print "Match!\n" if $var =~ /, W/;

print $var =~ s/Weldon/Doug/;
print $var, "\n";

# print $var =~ s/^.*, //;  # Deletes everything up to the email address

print $var =~ s/^.*?, //;   # Deletes everything up to the name
print $var =~ s/,.*$//;     # Deletes everything after the comma
print $var, "\n";