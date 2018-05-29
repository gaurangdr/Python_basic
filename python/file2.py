f = open('poem.txt', 'r')
l = []
for line in f :
	l += line.split()
f.close()
dict = {}
for w in l:
	dict[w.lower()]=l.count(w)
#print dict
d =  sorted(dict.items())
for i in d :
	print i[0], i[1]
