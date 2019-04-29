# Exercise 3 - A Roster class
class Student
    def initialize( first, last, email )
       @first = first
       @last  = last
       @email = email
    end
 
    def show
       puts "#{@first}  #{@last}  #{@email}"
    end
 end
 
 class Roster
     def initialize
         @students = [] # start with empty array
     end
     
     def add_student(student)
         @students.push(student)
     end
     
     def show
         @students.each do |student|
             student.show # Use .show method of the student class
         end
     end
 end
 
 # create new roster
 roster = Roster.new
 
 # Read roster file from $stdin
 for each in $stdin.readlines do
     (last, first, id) = each.split(/ *, */)
     
     roster.add_student(student)
 end
 
 # show roster
 roster.show
 