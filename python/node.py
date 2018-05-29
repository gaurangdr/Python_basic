class Node:
    def __init__(self,initdata):
        self.data = initdata
        self.next = None

    def getData(self):
        return self.data

    def getNext(self):
        return self.next

    def setData(self,newdata):
        self.data = newdata

    def setNext(self,newnext):
        self.next = newnext

	def addNode(self, data):
		self.setNext()
		self.setData(data)
node = Node(100)
print node.getData()
node.addNode(200)
print node.getData()
