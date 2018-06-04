import re
import csv
import os
import subprocess
import argparse
import xml.etree.ElementTree as ET
from ConfigParser import SafeConfigParser

parser = argparse.ArgumentParser()
parser.add_argument('--config', action="store", required=True, help='config file as input')
arg =  parser.parse_args()

config_file =  arg.config


parser = SafeConfigParser()
parser.read(config_file)

path =  parser.get('testcase', 'username') + ':' + parser.get('testcase','path')
password = parser.get('testcase', 'password')

subprocess.call(['sshpass', '-p', password, 'sftp', path])

file_name = os.path.basename(path)

f= open(file_name,'r')
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


testsuites = ET.Element('testsuites')
testsuite = ET.SubElement(testsuites, 'testsuite',ts)
for testname in test.keys() :
	testcase = ET.SubElement(testsuite, 'testcase', {'name' :testname})
	if test[testname]['Last test executed status'] == 'FAIL' :
		sysout = ET.SubElement(testcase,'error')
	else :
		sysout = ET.SubElement(testcase,'system-out')
#	text_strng = ''
#	for attr in test[testname].keys() :
#		text_strng += attr + ' -------------> ' + test[testname][attr] + '  '
	sysout.text = test[testname]['strng']
#print tostring(testsuites)

f = open('xml_file.xml', 'w')
f.write(ET.tostring(testsuites))
f.close()


tree = ET.parse('xml_file.xml')
root = tree.getroot()

#with open('test.csv','w') as csvfile:
csvfile = open('test.csv','w')
csv_writer = csv.writer(csvfile)
#print root.tag
test_head = []


data_row = ['Test name', 'Result']
csv_writer.writerow(data_row)
for testcase in root.iter('testcase'):
	data_row = []
	name = testcase.attrib['name']
	data_row.append(name)
	if testcase[0].tag == 'error' :
		data_row.append('FAIL')
	else:
		data_row.append('PASS')
	csv_writer.writerow(data_row)
