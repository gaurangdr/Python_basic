def max1(a, b, c):
	if a > b :
		if a > c:
			return a
		else :
			return c
	else :
		if b > c:
			return b
		else :
			return c
def max2(a, b, c):
	if a > b and a > c : 
		return a
	elif b > c :
		return b
	else :
		return c
val=max2(10,20,30)
print val
val=max2(10, 40, 30)
print val
val=max2(50, 40, 30)
print val
