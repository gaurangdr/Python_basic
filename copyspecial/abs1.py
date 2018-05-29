import os
import sys
import re
argv = set(sys.argv[1:])
abs_path = []
for dir_name in argv :
	dir_path = os.path.abspath(dir_name)
	try :
		dir_list =  os.listdir(dir_path)
	except:
		print 'Error: Directory not found (%s)' %(dir_path)
	for file_name in dir_list :
		path = re.search(r'__\w+__', file_name)
		if path :
			abs_path.append(dir_path + '/' + file_name)
return abs_path
