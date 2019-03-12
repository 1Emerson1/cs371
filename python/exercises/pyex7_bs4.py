# pyex7.py - Parse headlines & URLs from monmouth.edu/news/archives
#            using BS4 module

import requests
import bs4

url = requests.get("https://www.monmouth.edu/news/archives")

html_contents = url.text # string, containing html from URL

munews__soup = bs4.BeautifulSoup(html_contents, "lxml")

articles = munews__soup.select('article') # list of bs4 tag objects

titles = []
# print the title
for article in articles:         # each article is a dictionary
    titles.append(article['aria-label']) # title

links = []
 # print the links:
for article in articles:
    anchor = article.find('a')   # find nested <a tag in <article
    links.append(anchor['href'])  # print link which is the value for key 'href'
    # print(anchor['title'])     # another way to get the article title

# make newsfeed dictionary using a list comprehension
newsfeed = dict( [(titles[i], links[i]) for i in range(len(titles))] )
print (newsfeed)
