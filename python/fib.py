def fib(n):    # write Fibonacci series up to n
	a, b = 0, 1
	lis = []
	while a < n:
		lis.append(a)
		a, b = b, a+b
	return lis 

# Now call the function we just defined:
list = fib(200)
print list
