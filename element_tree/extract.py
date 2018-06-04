import re
import os
from xml.etree.ElementTree import Element, SubElement, Comment, tostring

f= open('test.txt','r')
s = '(Total run count|Total pass count|Total failure count|Last test error code|Consecutive failure count|Last test executed status) --.+\s(.+)'
test = {}
strng = ''
flag = 0
for line in f :
	m = re.search('\d+\)\s(\w+.+[T,t]est)',line)
	if m :
		test_name = m.group(1)
		test[test_name] = {}
	else :
		m = re.search(s,line)
		if m :
			strng = strng + m.group() +'\n'
			flag += 1
	if flag == 6 :
		test[test_name]=strng
		flag = 0
		strng = ''
for key in test.keys() :
	print key
	print test[key]
	print
