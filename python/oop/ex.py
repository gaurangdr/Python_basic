class Encpl:
	count = 0
	def __init__(self, data1, data2):
		self.data1 = data1;
		self.data2 = data2;
		Encpl.count += 1
	def dis(self):
		print "data1:", self.data1, ", data2:", self.data2, ", count:", self.count
x1= Encpl(10, 20)
print x1.count
x2= Encpl(30, 40)
x3 = x2
x1.dis()
x1.count = 20
print Encpl.count
print x1.count
x3 = Encpl(50, 60)
print Encpl.count
Encpl.count = 60
print x2.count
print x3.count
print x1.count
x1.dis()
x2.dis()
x3.dis()
print x1.count is x2.count
