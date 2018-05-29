class Test:
	i = 123
x = Test()
print (Test.i)
print (x.i)
#x.i = 12
Test.i = 12
print (id(Test.i))
print (id(x.i))
print (Test.i)
print (x.i)
