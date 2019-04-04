# Problem 3:
# (10 points)

# Write 'prob3.py' to output the total number of words in the 'english.sorted'
# file that contain consecutive Cs, case insensitive, e.g., peccadillo.

# Do not display the words; display only the total number of words that
# contain consecutive Cs.

# The program must read 'english.sorted' as a FILE OBJECT, not through standard
# input.

# Your program MUST use Python regular expression matching.

# References:
#    . Section of the Python notes on "Python Syntax - files (not stdin)".
#    . Section of the Python notes on "Python & regular expressions"

import re

input_file = open("english.sorted.python", "r")

count = 0
for line in input_file:
    cc_pattern = re.compile("^(?:.+)?(?:c|C){2,}.+$")
    if(cc_pattern.match(line)):
        count = count+1

print (count)