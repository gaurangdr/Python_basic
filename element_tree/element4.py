import re
import os
from xml.etree.ElementTree import Element, SubElement, Comment, tostring

f= open('test.txt','r')
s = '(Total run count|Total pass count|Total failure count|Last test error code|Consecutive failure count|Last test executed status) --.+\s(.+)'
test = {}
strng = ''
flag = 0
test_name = None
for line in f :
	m = re.search('\d+\)\s(\w+.+[T,t]est)',line)
	if m :
		test_name = m.group(1)
		test[test_name] = {}
	else :
		m = re.search(s,line)
		if m :
			parameter = m.group(1)
			value = m.group(2)
			test[test_name][parameter] = value
			strng = strng + m.group() + '\n'
			flag += 1
	if flag == 6 :
		test[test_name]['strng']=strng
		strng = ''
		flag = 0

fail_count = 0
pass_count = 0

for keys1 in test.keys():
	if int(test[keys1]['Total run count']) == 0 :
		del test[keys1]
	else:
		if test[keys1]['Last test executed status'] == 'FAIL' :
			fail_count += 1
		else:
			pass_count += 1

ts = {'errors':str(fail_count), 'name':'TEST_RESULTS','tests':str(pass_count)}
#print fail_count, pass_count


testsuites = Element('testsuites')
testsuite = SubElement(testsuites, 'testsuite',ts)
for testname in test.keys() :
	testcase = SubElement(testsuite, 'testcase', {'name' :testname})
	if test[testname]['Last test executed status'] == 'FAIL' :
		sysout = SubElement(testcase,'error')
	else :
		sysout = SubElement(testcase,'system-out')
#	text_strng = ''
#	for attr in test[testname].keys() :
#		text_strng += attr + ' -------------> ' + test[testname][attr] + '  '
	sysout.text = test[testname]['strng']
#print tostring(testsuites)

f = open('xml_file.xml', 'w')
f.write(tostring(testsuites))
f.close()
