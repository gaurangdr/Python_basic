#!/usr/bin/python

class Parent:        # define parent class
	parentAttr = 100
	def __init__(self, data = 10):
		self.data = data
		print "Calling parent constructor"

	def parentMethod(self):
		print 'Calling parent method'

	def setAttr(self, attr):
		self.parentAttr = attr

	def getAttr(self):
		print "Parent attribute :", self.parentAttr

class Child(Parent): # define child class
	def __init__(self, data = 11):
		self.data = data
		print "Calling child constructor"

	def childMethod(self):
		print 'Calling child method'

	def change(self):
		self.parentAttr += 10
		print self.parentAttr
p = Parent()
p1 = p
c = Child()          # instance of child
p = c
print p1 is p
print c.data
c.childMethod()      # child calls its method
p.childMethod()
c.parentMethod()     # calls parent's method
#c.setAttr(200)       # again call parent's method
c.change()
c.getAttr()          # again call parent's method

