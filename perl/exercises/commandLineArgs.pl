# commandLineArgs.pl - use command line arguments with <>

print "@ARGV\n";

while(<>) {
    print $_;
}
print "@ARGV\n" # - Empty @ARGV at end of program, so no output.