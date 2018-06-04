import re
import os

f= open('test.txt','r')
flag = 1

s = '(Total run count|Total pass count|Total failure count|Last test error code|Consecutive failure count|Last test executed status) --.+\s(.+)'
test = {}
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
counter = 0
total_count = 0
for keys1 in test.keys():
	if int(test[keys1]['Total run count']) == 0 :
		del test[keys1]
	else:
		total_count += 1
		if test[keys1]['Last test executed status'] == 'FAIL' :
			counter = counter + 1
		print keys1
		for ky in test[keys1].keys() :
				print ky, test[keys1][ky]
		print
print counter, total_count

print test
