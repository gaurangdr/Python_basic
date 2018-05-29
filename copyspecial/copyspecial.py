#!/usr/bin/python
# Copyright 2010 Google Inc.
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0

# Google's Python Class
# http://code.google.com/edu/languages/google-python-class/

import sys
import re
import os
import shutil
import commands

"""Copy Special exercise
"""

# Write functions and modify main() to call them

def get_special_paths(dir) :
	abs_path = []
	dir_path = os.path.abspath(dir)
	try:
		dir_list =  os.listdir(dir_path)
	except:
		print "Error:\"%s\"dir is not found" %(dir_path)
		return []
	for file_name in dir_list :
		path = re.search(r'__\w+__', file_name)
		if path :
			abs_path.append(dir_path + '/' + file_name)
	return abs_path	


def copy_to(abs_path, to_dir):
	if not os.path.exists(to_dir) :
		os.makedirs(to_dir)

	for files in abs_path:
		shutil.copy(files, to_dir)

def zip_to(abs_path,zip_name) :

	strng = ' '.join(abs_path)
	base_dir= os.path.dirname(zip_name)

	if base_dir and os.path.exists(base_dir) :
		print 'Zipping...\nzip -j '+ zip_name + ' '+ strng
		os.system('zip -j '+ zip_name + ' '+ strng)
	elif not base_dir :
		print 'Zipping...\nzip -j '+ zip_name + ' '+ strng
		os.system('zip -j '+ zip_name + ' '+ strng)
		os.system('zip -j '+ zip_name + ' '+ strng)
	else:
		print "Failed to zip as \"%s\" path doen't exist" %(os.path.abspath('.') + '/' + zip_name)

def main():
  # This basic command line argument parsing code is provided.
  # Add code to call your functions below.

  # Make a list of command line arguments, omitting the [0] element
  # which is the script itself.
  args = sys.argv[1:]
  if not args:
    print "usage: [--todir dir][--tozip zipfile] dir [dir ...]";
    sys.exit(1)

  # todir and tozip are either set from command line
  # or left as the empty string.
  # The args array is left just containing the dirs.
  todir = ''
  if args[0] == '--todir':
    todir = args[1]
    del args[0:2]

  if len(args) == 0:
    print "error: must specify one or more dirs"
    sys.exit(1)

  tozip = ''
  if args[0] == '--tozip':
    tozip = args[1]
    del args[0:2]

  if len(args) == 0:
    print "error: must specify one or more dirs"
    sys.exit(1)

  dir_list = args

  abs_path = []

  for dir_name in dir_list :
		abs_path = abs_path + get_special_paths(dir_name)

  if todir :
	copy_to(abs_path, todir)

  elif tozip :
	zip_to(abs_path, tozip)

  else:
	  for name in abs_path :
		print name
  
if __name__ == "__main__":
  main()
