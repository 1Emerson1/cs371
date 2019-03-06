# pyex3.py - String length
import sys

print('Enter your first name: ')
for line in sys.stdin:
    print(line)
    print(len(line))
    # counts new line as character
    
    line = line.rstrip()
    # same effect as Perl chomp()
    print(len(line))

    

