def fun_outer():
	var = 10		## local to fun
	print ('outer_fun', (var * 2))
	global var
	def fun_inner():
		global var		## global variable
		var = 5
		print ('inner_fun', var) ## print 5
	fun_inner()
	print ('outer_fun_var:', var) ## print local value 10 of var
var = 12
fun_outer()
print ('global', var) ## print gloal value 5 of var
