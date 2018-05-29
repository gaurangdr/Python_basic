import re
dict_name= {}
file= open("baby1992.html","r")
for line in file :
	year = re.search("<h3 align=\"center\">Popularity in ([0-9]+)</h3>",line)
	if year :
		yr = year.group(1)
		break
for line in file :
	m = re.search("<tr align=\"right\"><td>([0-9]+)</td><td>(.[a-z]+)</td><td>(.[a-z]+)",line)
	if m :
		dict_name[m.group(2)] = m.group(1)
		dict_name[m.group(3)] = m.group(1)
file.close()
list_name= dict_name.items()
list_tuple = sorted(list_name)
list = []
for i in list_tuple:
	list.append(i[0]
	list.appned.(i[1])
list.insert(0,yr)
print list
