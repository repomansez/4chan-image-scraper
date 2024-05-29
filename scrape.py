import requests
import sys
import re
import string
from bs4 import BeautifulSoup

html = requests.get(sys.argv[1]).content

soup = BeautifulSoup(html, 'html.parser')

for ass in soup.find_all("a", target="_blank"):
    if re.search("is2", str(ass)):
        ass1 = "https:" + ass.get('href')
        print(ass1)


