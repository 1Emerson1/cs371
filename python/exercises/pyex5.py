# pyex5.py - read file as first command line argument
import sys

args = sys.argv # list

# usage fnc
def help():
    print ("Usage: " + args[0] + " input_file")
    sys.exit(1) 

def readFile(input):
    file = open(input, "r")

    content = file.read() # one string containing entire input file
    return content


def writeFile(input, output):
    file = open(output, "w")

    file.write(input)
    file.close()

# call help() if incorrect number of cmd line args:

if(len(args) != 3):
    help()
else: 
    writeFile(readFile(args[0]), "output.txt")