import re
import os
import sys
import urllib

file = open(sys.argv[1], 'r')
text = file.read()
file.close()


def key_fun(s) :
	m = re.search(r'edu.*(.....jpg)',s)
	if m :
		return m.group(1)
	else:
		return s
	

match = re.findall(r'GET /(edu.+jpg)', text)
match_list = set(match)
match_list= sorted(match_list, key = key_fun)
match_list= list(match_list)
url_list = ['http://code.google.com/' + url for url in match_list]
for m in url_list :
	print m

os.mkdir("images")
os.chdir("images")
i = 0

try :
	for url in url_list :
		print 'Downloading image %s' %(url)
		urllib.urlretrieve(url, 'img' + str(i))
		i +=1
except:
	print 'Downloading error'
text = '<verbatim>\n<html>\n<body>\n'
j = 0
while j < i :
	text = text + '<img src=\"img%d\">' %(j)
	j +=1

text = text + '\n</body>\n</html>'
print text

f = open('index.html', 'w')
f.write(text)
f.close()
