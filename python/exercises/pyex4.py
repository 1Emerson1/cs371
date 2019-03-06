#pyex4.py - word length occurances in english.sorted
import sys

# create input file object
input_file = open('english.sorted.python', 'r')

# declare empty dictionary
wordLengths = {}

# iterate through lines of input_file
for word in input_file.readlines():
    length = len(word)-1
    
    if(length in wordLengths):    # if the length key is found in wordLengths
        wordLengths[length] += 1  # increment value in wordlengths
    else:
        wordLengths[length] = 1   # initialize new value to 1 (new key: value pair)

# print word lengths & occurrences
print("Word Length \t\tOccurrences")

for length in wordLengths.keys():
    print('%i\t\t\t%i' % (length, wordLengths[length]))