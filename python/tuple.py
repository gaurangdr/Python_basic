def sort1(s):
	return s[-1]
s= [(1,10),(8,3,9),(3,4,6,7)]
print s
s1= sorted(s)
print s1
print sorted(s, key = sort1)
