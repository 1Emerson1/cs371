# rubyex1_parser.rb - parse article titles/links from munews

require 'rubygems'
require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("https://www.monmouth.edu/news/archives"))
#                    open() method from open-uri ruby gem

# puts doc.class

# Get all articles in doc
# All articles appear in <article> tags.
articles = doc.css("article")
# puts articles.class # Nokogiri::XML::Nodeset, which is also a ruby array

# Extract titles and links
articles.each do |article|
    anchor = article.css("a")
    #puts anchor

    # puts anchor["title"] # doesn't work
    puts anchor.first["title"] # "title" is a hash key of anchor.first

    puts anchor.first["href"]
end