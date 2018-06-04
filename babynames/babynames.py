#!/usr/bin/python
# Copyright 2010 Google Inc.
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0

# Google's Python Class
# http://code.google.com/edu/languages/google-python-class/

import sys
import re

"""Baby Names exercise

Define the extract_names() function below and change main()
to call it.

For writing regex, it's nice to include a copy of the target
text for inspiration.

Here's what the html looks like in the baby.html files:
...
<h3 align="center">Popularity in 1990</h3>
....
<tr align="right"><td>1</td><td>Michael</td><td>Jessica</td>
<tr align="right"><td>2</td><td>Christopher</td><td>Ashley</td>
<tr align="right"><td>3</td><td>Matthew</td><td>Brittany</td>
...

Suggested milestones for incremental development:
 -Extract the year and print it
 -Extract the names and rank numbers and just print them
 -Get the names data into a dict and print it
 -Build the [year, 'name rank', ... ] list and print it
 -Fix main() to use the extract_names list
"""

def extract_names(filename1):
  """
  Given a file name for baby.html, returns a list starting with the year string
  followed by the name-rank strings in alphabetical order.
  ['2006', 'Aaliyah 91', Aaron 57', 'Abagail 895', ' ...]
  """
  dict_name= {}
  try :
	filename= open(filename1,"r")
  except:
	print "%s : file not found" %(filename1)
	sys.exit(1)
  for line in filename :
	year = re.search(r'Popularity in ([0-9]+)', line)
	if year :
		yr = year.group(1)
  		if not yr :
			print "Year not found"
			sys.exit(1)
		break
  for line in filename :
	m = re.search("<tr align=\"right\"><td>([0-9]+)</td><td>(.[a-z]+)</td><td>(.[a-z]+)",line)
	if m :
		if m.group(2) not in dict_name.keys() :
			dict_name[m.group(2)] = m.group(1)
		if m.group(3) not in dict_name.keys() :
			dict_name[m.group(3)] = m.group(1)
  filename.close()
  list_name= dict_name.items()
  list_tuple = sorted(list_name)
  list = []
  for i in list_tuple:
	list.append(i[0] + ' ' + i[1])
  list.insert(0,yr)
  return list


def main():
  # This command-line parsing code is provided.
  # Make a list of command line arguments, omitting the [0] element
  # which is the script itself.
  args = sys.argv[1:]

  if not args:
    print 'usage: [--summaryfile] file [file ...]'
    sys.exit(1)

  # Notice the summary flag and remove it from args if it is present.
  summary = False
  if args[0] == '--summaryfile':
    summary = True
    del args[0]

  filename = args[0]
  # +++your code here+++
  # For each filename, get the names, then either print the text output
  # or write it to a summary file

  list = extract_names(filename)

  if summary :
	strng = '\n'.join(list)
	f = open (filename + '.summary', 'w')
	f.write(strng)
	f.close()
  else :
	for name in list :
		print name
	
if __name__ == '__main__':
  main()
