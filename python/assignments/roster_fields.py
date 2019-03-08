# roster_fields.py
import sys
import re

input_file = open("cs176roster.webadvisor.txt", "r")
output_file = open("roster.txt", "w")
roster = input_file.read()

pattern = re.compile('\n\n')
roster = pattern.split(roster)

pattern = re.compile('\n')
for line in roster:
    line = pattern.split(line)
    output_file.write("%s, %s, %s, %s, %s\n" % (line[0], line[1], line [3], line[4], line[5]))

output_file.close()