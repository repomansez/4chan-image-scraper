import requests
import sys
import re
import string
from bs4 import BeautifulSoup

# This gets the thread link from downloader.sh and requests its content
html = requests.get(sys.argv[1]).content

soup = BeautifulSoup(html, 'html.parser')

# This loop finds every link with "is2" in it (4chan cdn) and prints it to stdout
# which gets outputted into a file by downloader.sh
for ass in soup.find_all("a", target="_blank"):
    if re.search("is2", str(ass)):
        ass1 = "https:" + ass.get('href')
        print(ass1)


