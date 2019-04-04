# pyrss2gentest.py - Test the PyRSS2Gen module

import PyRSS2Gen
import datetime

titles = ['titles 0', 'titles 1', 'title 2']

links = ['http://link0.com', 'http://link1.com', 'http://link2.com']

descriptions = ['yesterday', 'today', 'tomorrow']

# construct an rss object
rss = PyRSS2Gen.RSS2 (
    title = "A PyRSS2Gen feed",
    link = "http://test.html",
    description = "The latest news about something",
    lastBuildDate = datetime.datetime.now(),
    items = []
)

# fill items list in rss object
for i in range(len(titles)):
    rss.items.append(PyRSS2Gen.RSSItem(title = titles[i],
                                       link = links[i],
                                       description = descriptions[i]))

rss.write_xml(open("pyrssgentest.xml", "w"))