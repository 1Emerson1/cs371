# pyex6.py - extract fields from webadvisor roster
import re

input_file = open('cs176roster.webadvisor.txt', 'r')

out_file = open('roster.txt', 'w')

contents = input_file.read() # a string containing entire file

# student_pattern contains a regex that defines one student:
student_pattern = re.compile(r'.+?,\s.+\n[0-9]{7}\n')
#                              .+?                    = last name
#                                 ,                   = comma space
#                                  \s+?               = first name and middle name
#                                      \n             = newline
#                                        [0-9]{7}     = student id

students = student_pattern.findall(contents)

for student in students:
    student = re.sub(r'\n', ', ', student, 1)
    out_file.write(student)

out_file.close()


