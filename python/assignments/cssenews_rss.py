import requests
import re
import bs4
import PyRSS2Gen
import datetime

html = open("desc.html", "w")

# BEGIN FNCS

def limitwords(passage):
    list_pass = passage.split(' ')
    if(len(list_pass) > 75):
        desc = " ".join(list_pass[0:74])
        word = desc[0:desc.rindex(".")+1]
    else:
        word = " ".join(list_pass)
    
    return  word

# END FNCS

titles = []
links = []
descriptions = []

# html page request
url = requests.get("https://www.monmouth.edu/department-of-csse/news-events")
html_contents = url.text
munews = bs4.BeautifulSoup(html_contents, "lxml")

article = munews.find('article')

print (article.prettify(), file=html)

# removing excess tags
    # removing captions
for caption in article.find_all('p', class_='aligncenter keepwidth'):
    caption.decompose()

    # removing read more links
for href in article.find_all('a', text=re.compile('Read')):
    href.parent.decompose()

for div in article.find_all('div', {'style': 'float: right;margin: 10px 20px'}):
    div.decompose()

    # removing first caption & header/p tags
article.find('div', class_='wp-caption alignright').decompose()
article.find('header').decompose()
article.find('p').decompose()

# titles
for title in munews.find_all('strong'):
    titles.append(title.get_text())
    title.parent.decompose()

# links
for anchor in munews.find_all("a", class_="anchorMargin"):
    links.append("https://www.monmouth.edu/department-of-csse/news-events#"+anchor['name'])
    anchor.decompose()

# descriptions
desc_pattern = re.compile("[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}")

article = article.get_text()
desc = desc_pattern.split(article)

del desc[0]
del desc[len(desc)-1]

for description in desc:
    description = limitwords(description.strip())



# rss object

# rss = PyRSS2Gen.RSS2 (
#     title = "Monmouth University CSSE News and Events",
#     link = "http://rockhopper.monmouth.edu/~s1049128/cssenews.rss.xml",
#     description = "Monmouth University's Department of Computer Science and Software Engineering News and Events",
#     lastBuildDate = datetime.datetime.now(),
#     items = []
# )

# fill RSS's items list
# for i in range(len(titles)):
#     rss.items.append(PyRSS2Gen.RSSItem(title = titles[i],
#                                        link = links[i],
#                                        description = descriptions[i]))

#rss.write_xml(open("cssenews.rss.xml", "w"))