#!/usr/bin/python

# Define a function here.
def temp_convert(var):
	try:
		return int(var)
	finally:
		print "fun cal"
	except:
		print "The argument does not contain numbers\n", Argument

# Call above function here.
temp_convert("xyz");
