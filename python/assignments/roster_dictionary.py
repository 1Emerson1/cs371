# roster_dictionary.py
import sys
import re

file = open("roster.txt", "r")

roster = {}
pattern = re.compile(r',\s+')
for line in file.readlines():
    # remove next line character
    line = line.rstrip()
    # split line into list
    student = pattern.split(line)
    # set key
    roster[student[1]+' '+student[0]] = student[2]

# prints dictionary sorted
for student in sorted (roster):
    print ("%s %s" % (student, roster[student]))