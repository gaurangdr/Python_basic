class Test:
	def fun(self):
		print ("in fun:")
print (type(Test))
t = Test()
#Test.fun()
print (type(t))
print (type(t.fun))
print (type(Test.fun))
print (type(33))
