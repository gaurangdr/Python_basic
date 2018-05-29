class Encapsulation:
	def __init__(self, a, b, c):
	 	self.public = a
		self._protected = b
		self.__private = c
	def dis(self):
		print self.__private

x1= Encapsulation(10,20,30)
print x1.public
print x1._protected
x1.dis()
try:
	print x1.__private
except:
	print "exception"
