# Problem 4:
# (10 points)

# Write 'prob4.py' to print a month, such as the following

#            March 2019
#       Mo Tu We Th Fr Sa Su
#                    1  2  3
#        4  5  6  7  8  9 10
#       11 12 13 14 15 16 17
#       18 19 20 21 22 23 24
#       25 26 27 28 29 30 31


# Your prob4.py will take the month and year as command line arguments.  Running
# your prob4.py like this:

#        $ python3 prob4.py 3 2019

# will generate the above calendar.

# Python command line arguments are string type by default, so the month
# and year command line arguments will have to be cast to integer with
# (int).

# See the following sections of the notes:
#    . "Python Intro"
#    . "Python Syntax - command line arguments".

import calendar
import sys

cal = calendar

year = (int)(sys.argv[2])
month = (int)(sys.argv[1])

print (cal.prmonth(year, month))