class Node:
   def __init__(self,data,nextNode=None):
       self.data = data
       self.nextNode = nextNode

   def getData(self):
       return self.data

   def setData(self,val):
       self.data = val

   def getNextNode(self):
       return self.nextNode

   def setNextNode(self,nodeAddress):
       self.nextNode = nodeAddress

class LinkedList:

   def __init__(self,head = None):
       self.head = head
       self.size = 0

   def getSize(self):
       return self.size

   def addNode(self,data):
       print data, self.head
       newNode = Node(data,self.head)
       self.head = newNode
       print data, self.head
       newNode = Node(data,self.head)
       self.size+=1
       return True

   def addByIndex(self, data, index):
       if index == 1 :
			self.addNode(data)
			return True
       if index > self.size + 1  :
			return False
       cur = self.head
       while index > 2 :
			cur = cur.nextNode
			print index
			index -= 1
       print cur
       temp = cur
       cur.nextNode= Node(data, cur.nextNode)

   def rmNode(self):
       self.head = self.head.getNextNode()
       
   def printNode(self):
       curr = self.head
       while curr:
           print(curr.data)
           curr = curr.getNextNode()

   def rmByIndex(self, index) :
       if index == 1 :
			self.rmNode()
			return True
       if index > self.size + 1  :
			return False
       cur = self.head
       while index > 2 :
			cur = cur.nextNode
			print index
			index -= 1
       cur.nextNode = cur.nextNode.nextNode

   def rmByData(self, data) :
		cur = self.head
		while cur :
			if cur.data == data : 
				temp.nextNode= cur.nextNode
				return True
			temp = cur
			cur = cur.nextNode
		return False

myList = LinkedList()
#print("Inserting")
myList.addNode(10)
myList.addNode(20)
myList.addNode(30)
myList.addNode(40)
myList.rmByData(2)
#print myList.head
#myList.rmNode()
#myList.addByIndex(50,5)
#myList.rmByIndex(1)
#print myList.head
#print(myList.addNode(15))
#print(myList.addNode(25))
#print("Printing")
myList.printNode()
#print("Size")
#print(myList.getSize())
