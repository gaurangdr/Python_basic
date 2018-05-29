def VarArgFun(arg1, arg2, *more): # here more is type tuple
#	list = list(more)
#	print list[1]
	print arg1, arg2, more[2]
VarArgFun(10, 20, 30, 40)
VarArgFun(40, 50, 60, 70)
VarArgFun("J&K", "Pun", "Har", 10, 20)
