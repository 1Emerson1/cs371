# rubyex1.rb - News screen-scrape

# Read html file as file object:
f = File.new("archives.html", "r")
html = f.read

# alternatively, use standard input
# html = @stdin.read # use built-in #stdin global var

# create title regex pattern object
title_re = %r|aria-label="Article (.+?)">|
titles = html.scan(title_re) # .scan is like Python's findall() method

# create links regex pattern object
links_re = %r|<a href=\'(.+?)\' title=".+?">|
links = html.scan(links_re)

print links
