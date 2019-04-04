# Problem 2:
# (10 points)

# You should have a file called 'english.sorted' from previous exercises.  If
# not, get it from 
# https://piazza.com/class_profile/get_resource/jr84sjtjd401tl/jsm9ixzyf9w4p5.

# Write and save the program 'prob2.py' to output all words in 'english.sorted'
# that begin with an uppercase letter. The output must be one word per line of 
# output.

# The program must read 'english.sorted' through STANDARD INPUT.

# Your program MAY use Python regular expression matching.

import sys

for line in sys.stdin:
    line = line.strip()
    if(line[0].isupper()):
        print(line)