# Person.rb

class Person
    attr_accessor :name, :age, :gender
    # note use of symbols
end

person_instance = Person.new

person_instance.name = "Robert"

person_instance.age = 52

person_instance.gender = "male"

puts person_instance.name