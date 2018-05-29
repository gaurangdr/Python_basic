import os
import sys
import re
import shutil

argv = sys.argv[1:]

to_dir = argv[0]
dir = argv[1]
zip_name= argv[2]
abs_path = []

dir_path = os.path.abspath(dir)
try:
	dir_list =  os.listdir(dir_path)
except:
	print "Error: Dir not found"

for file_name in dir_list :
	path = re.search(r'__\w+__', file_name)
	if path :
		abs_path.append(dir_path + '/' + file_name)
#return abs_path	

for name  in abs_path :
	print  name

if not os.path.exists(to_dir) :
	os.makedirs(to_dir)

for files in abs_path:
	shutil.copy(files, to_dir)


strng = ' '.join(abs_path)

base_dir= os.path.dirname(zip_name)
if base_dir and os.path.exists(base_dir) :
	os.system('zip -j '+ zip_name + ' '+ strng)
elif not base_dir :
	os.system('zip -j '+ zip_name + ' '+ strng)
else:
	print "Failed to zip"
	
	
"""
if os.path.exists(zip_name) : 
	print 'exist'
else:
	print "Not exist"
try :
	os.system('zip -j '+ zip_name + ' '+ strng)
except:
	print "Failed """
