import requests
import re
import bs4
import PyRSS2Gen
import datetime

# BEGIN FNCS

def limitwords(passage):
    list_pass = passage.split(" ")
    if(len(list_pass) > 75):
        passage = " ".join(list_pass[0:74])
        cut_pass = passage[0:passage.rindex(".")+1]
    else:
        cut_pass = " ".join(list_pass)

    return  cut_pass

# END FNCS

titles = []
links = []
desc = []

# html page request
url = requests.get("https://www.monmouth.edu/department-of-csse/news-events")
html_contents = url.text
munews = bs4.BeautifulSoup(html_contents, "lxml")

article = munews.find("article")

# removing excess tags
    # removing captions
for caption in article.find_all("p", class_="aligncenter keepwidth"):
    caption.decompose()

    # removing read more links
for href in article.find_all("a", text=re.compile("Read")):
    href.decompose()

for div in article.find_all("div", {"style": "float: right;margin: 10px 20px"}):
    div.decompose()

    # removing first caption & header/p tags
article.find("div", class_="wp-caption alignright").decompose()
article.find("header").decompose()
article.find("p").decompose()

# titles
for title in munews.find_all("strong"):
    titles.append(title.get_text())
    title.parent.decompose()

# links
for anchor in munews.find_all("a", class_="anchorMargin"):
    links.append("https://www.monmouth.edu/department-of-csse/news-events#"+anchor["name"])
    anchor.decompose()

# descriptions
desc_pattern = re.compile(r"[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}(?![0-9]+)")

# removing unneccessary newline characters
article = re.sub("\n+", "\n", article.get_text())
desc = desc_pattern.split(article)
del desc[0]

# rss object

rss = PyRSS2Gen.RSS2 (
    title = "Monmouth University CSSE News and Events",
    link = "http://rockhopper.monmouth.edu/~s1049128/cssenews.rss.xml",
    description = "Monmouth University's Department of Computer Science and Software Engineering News and Events",
    lastBuildDate = datetime.datetime.now(),
    items = []
)

#fill RSS's items list with first 20 articles
for i in range(20):
    rss.items.append(PyRSS2Gen.RSSItem(title = titles[i],
                                       link = links[i],
                                       description = desc[i]))

#rss.write_xml(open("../public_html/cssenews.rss.xml", "w"))
rss.write_xml(open("cssenews.rss.xml", "w"))