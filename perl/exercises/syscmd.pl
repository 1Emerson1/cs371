# syscmd.pl - Try using system commands in Perl.

# Perl equivalent system commands
#system('usr/games/fortune');

# Command substitution
my $sysdate = `date`;
print $sysdate;