import xml.etree.ElementTree as ET

tree = ET.parse('TestResults.xml')
root = tree.getroot()

print root.tag
print root.attrib

'''
print type(root[0][2][0])
print root[0][1].tag, root[0][1].attrib
print root[0][1][0].text
'''




'''
for child in root:
	print child.tag, child.attrib
	for grandchild in child:
		print grandchild.tag, grandchild.attrib
		for subchild in grandchild:
			print subchild.tag, subchild.attrib, subchild.text
'''
