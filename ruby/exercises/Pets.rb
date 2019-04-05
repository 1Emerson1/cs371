# Pets.rb

class Pet
    attr_accessor :name, :age, :gender, :color
end

class Cat < Pet
end

class Dog < Pet
    # Dog-specific method
    def bark
        puts "Woof!"
    end
end

class Snake < Pet
    attr_accessor :length
        # additional attribute for Snake
end