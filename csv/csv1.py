import csv
with open('test.csv', 'rb') as csvfile :
#	read_obj = csv.reader(csvfile, delimiter = ',')
	read_obj = csv.reader(csvfile)
	print (type(read_obj))

	for row in read_obj :
		print row
		for word in row :
			print word
		print
