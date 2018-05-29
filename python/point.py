class Point:
	def __init__(self, x, y):
		self.x, self.y = x, y
	def __repr__(self):
		return 'Point: x= %s, y= %s' %(self.x, self.y)
point = Point(1, 2)
print point
