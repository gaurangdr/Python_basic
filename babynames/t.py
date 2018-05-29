import sys
argv= sys.argv
print argv
if len(argv)  <  2 :
	print "Error"
	sys.exit()
if argv[1] == '--summaryfile' :
	if argv[2] :
		f = open(argv[2]+'.summary', 'w')

f1 = open("bn.py", "r")
txt = f1.read()
f.write(txt)
f1.close()
f.close()
