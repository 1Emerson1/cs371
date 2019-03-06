#python_re.py
import re

str = "I am a string"

# store RE in a RE pattern object:
regex = re.compile(r'string$')

#
# matching:
#
# finds first instance of regex using module's (re) search function:
if re.search(r'string$', str):
    print("str ends with 'string'")

# finds first instance of regex using RE pattern object:
if regex.search(str):
    print("str ends with 'string'")

# finds all instances of regex (returns list of matching substrings)
if regex.findall(str):  # findall being used as an if condition
    print("str ends with 'string'")

print(re.findall(r'[AEIOUaeiou]', str)) # findall being used normally


#
# search/replace:
#
# replaces all instances of ' a ' with ' another ' in str;
# so the default is global search and replace:
str = re.sub(r' a ', ' another ', str)
print("str is now " + str)

# Added "1" to replace only the first instance of ' a ' with ' another ' in str:
str = re.sub(r' a ', ' another ', str, 1)

#
# split:
#
pattern = re.compile(r'\W+')  # \W matches any non-alphanumeric character;

pattern.split('This is a test, short and sweet, of split().')
# output: ['This', 'is', 'a', 'test', 'short', 'and', 'sweet', 'of', 'split', '']

pattern.split('This is a test, short and sweet, of split().', 3)
# At most 3 splits are performed, and the rest of the string is left unsplit.
# output: ['This', 'is', 'a', 'test, short and sweet, of split().']


#
# regexp groups (back references in Perl):
#
mystring = "abcdefg"
mygroups = re.search( '(a.)(c.)(e.)(g)', mystring )
# mygroups is a "match object" (See http://docs.python.org/library/re.html#match-objects)

print(mygroups.group( 0 ))   # group( 0 ) is the whole of mystring, i.e., abcdefg
print(mygroups.group( 1 ))   # group( 1 ) is ab
print(mygroups.group( 2 ))
print(mygroups.group( 3 ))
print(mygroups.group( 4 ))   # group( 4 ) is g

mynewstring = mygroups.group(4) + mygroups.group(3) + mygroups.group(2)

print(mynewstring)