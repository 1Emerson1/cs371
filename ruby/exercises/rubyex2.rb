# rubyex2.rb - A Fortune class

class Fortune
    attr_accessor   :content

    # word_count: return number of words in :content
    def word_count
        @content.scan(/\w+/).size
            # @content exists because of :content
            # \w+ = one or more word chars
            # .scan() search a strong for matches, returns an array of matches
            # .size returns the size of an array
    end
end

# Test Fortune class
cookie = Fortune.new

# Use command substitution to store system 'fortune' command output
cookie.content = `fortune` # Use backward ticks

puts cookie.content

puts "\nThat fortune contained #{cookie.word_count} words."