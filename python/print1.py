def myPrint(list1):
	for name in list1:
		print name, len(name)

def myRange(list1,num):
	len1 = len(list1)
	print len1
	for i in range(num):
		print i, list1[i]
names = ["Jammu and Kashmir", "Punjab", "Haryana", "Uttarakhand"]
myPrint(names)
myRange(names, input("Enter number"))
