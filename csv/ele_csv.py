import re
import csv
import os
import subprocess
import argparse
import xml.etree.ElementTree as ET
from ConfigParser import SafeConfigParser

'''
	download the log file in current directory for the given config file and return log file name
'''
def get_log_file(config_file):
	parser = SafeConfigParser()
	parser.read(config_file)
	path =  parser.get('testcase', 'username') + ':' + parser.get('testcase','path')
	password = parser.get('testcase', 'password')
	subprocess.call(['sshpass', '-p', password, 'sftp', path])
	file_name = os.path.basename(path)
	return file_name

'''
	parse the log file and return dictionary of test case information
'''
def log_parse(log_file_name):
	log_file= open(log_file_name, 'r')

	pattern = '(Total run count|Total pass count|Total failure count|Last test error code|Consecutive failure count|Last test executed status) --.+\s(.+)'

	test = {} 	#Dictionary to save testcase information
	strng = ''  #string to store all test case info
	flag = 0
	test_name = None

	for line in log_file :
		match = re.search('\d+\)\s(\w+.+[T,t]est)',line)
		if match :
			test_name = match.group(1)
			test[test_name] = {}
		else :
			match = re.search(pattern,line)
			if match :
				parameter = match.group(1)
				value = match.group(2)
				test[test_name][parameter] = value
				strng = strng + match.group() + '\n'
				flag += 1
		if flag == 6 :
			test[test_name]['strng']=strng
			strng = ''
			flag = 0

	return test

'''
	from the testcase dictionary, remove the non run test case and return testcase dictionary with pass and fail test count
'''
def remove_non_run_testcases(test):
	fail_count = 0
	pass_count = 0
	for testname in test.keys():
		if int(test[testname]['Total run count']) == 0 :
			del test[testname]
		else:
			if test[testname]['Last test executed status'] == 'FAIL' :
				fail_count += 1
			else:
				pass_count += 1
	return (test, pass_count, fail_count)

'''
	generate TestResult.xml file frrom given dictionary and return xml file name
'''
def generate_xml(test_tuple):
	test, pass_count, fail_count = test_tuple
	testsuite_attribute = {'errors':str(fail_count), 'name':'TEST_RESULTS','tests':str(pass_count)}

	testsuites = ET.Element('testsuites')
	testsuite = ET.SubElement(testsuites, 'testsuite', testsuite_attribute)

	for testname in test.keys() :
		testcase = ET.SubElement(testsuite, 'testcase', {'name' :testname})
		if test[testname]['Last test executed status'] == 'FAIL' :
			sysout = ET.SubElement(testcase,'error')
		else :
			sysout = ET.SubElement(testcase,'system-out')
		sysout.text = test[testname]['strng']

	filename= 'TestResult.xml'
	f = open(filename, 'w')
	f.write(ET.tostring(testsuites))
	f.close()
	return filename

'''
	genrate TestResult.csv file from given xml file
'''
def generate_csv_from_xml(filename):
	tree = ET.parse(filename)
	root = tree.getroot()

	csvfile = open('TestResult.csv','w')
	csv_writer = csv.writer(csvfile)

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
	return filename

parser = argparse.ArgumentParser()
parser.add_argument('--config', action="store", required=True, help='Config file needed')
arg =  parser.parse_args()
config_file =  arg.config


file_log = get_log_file(config_file)
print
print (file_log + ' downloaded successfully')

testcases_dictionary = log_parse(file_log)

testcases_tuple = remove_non_run_testcases(testcases_dictionary)

file_xml = generate_xml(testcases_tuple)
print (file_xml + ' generated')

file_csv = generate_csv_from_xml(file_xml)
print (file_csv + ' generated')
