class MyClass:
	i = 124
	def greeting(self):
		print "Hello"
	def g2():
		print "G2"
	g2()

x = MyClass()
y = MyClass()

print x.i , y.i
x.i = 12;
print x.i
y.i = 24;
print x.i , y.i

#fun = x.greeting
#MyClass.greeting(x)
print type(MyClass)
print type(x)
print type(x.i)
print type(x.greeting)
print type(x.greeting())
#print type(fun)

x.count=10;
x.str = "India"
print x.str
while x.count < 20:
	print x.count
	x.count = x.count + 1
