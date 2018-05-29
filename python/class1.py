class animal:
	color = []
	i = 123
	def __init__(self, name) :
		self.name= name
	def add_color(self,col):
		self.color.append(col)

cow = animal("cow")
cow.i = 10
print cow.name
print cow.i

bf = animal("buffelow")
bf.i = 20
print bf.name
print bf.i

cow.add_color("white:")
print cow.i
print cow.color

bf.add_color("black")
print bf.color
