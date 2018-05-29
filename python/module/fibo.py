def fib(num):
	a, b = 0, 1
	temp = 0
	list = []
	while a < num:
#		temp, a, b = a + b, b, temp
		list.append(a)
		t = a + b
		a = b
		b = t
	return list
