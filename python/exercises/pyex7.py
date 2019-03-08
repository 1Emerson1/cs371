# pyex7.py - Parse headlines & URLs from monmouth.edu/news/archives

import requests
import re

url = requests.get("https://www.monmouth.edu/news/archives")
# print(type(url)) # verify type of variable

html_contents = url.text # string, containing html from URL

headlines_re = re.compile(r'<div class="article-header">\s+(.+?)\s+<\/div>')
# headlines list
headlines = headlines_re.findall(html_contents)

links_re = re.compile(r'<a href=\'(.+?)\' title=".+?">')
# links list
links = links_re.findall(html_contents)

# make newsfeed dictionary
newsfeed = {}

for i in range(len(headlines)):
    key = headlines[i]
    val = links[i]
    newsfeed[key] = val

for article in newsfeed.keys():
    print ("%s: %s" % (article, newsfeed[article]))