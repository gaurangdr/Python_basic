from xml.etree.ElementTree import Element, SubElement, Comment, tostring

top = Element('top')

comment = Comment('Generated for PyMOTW')
top.append(comment)

child = SubElement(top, 'child', {'error':'10','name':'WFH'})
child.text = 'This child contains text.'
#child.attrib='name'
#          current_group = SubElement(body, 'outline', {'text':group_name})
child_with_tail = SubElement(top, 'child_with_tail')
child_with_tail.text = 'This child has regular text.'
child_with_tail.tail = 'And "tail" text.'

child_with_entity_ref = SubElement(top, 'child_with_entity_ref')
child_with_entity_ref.text = 'This & that'


child = SubElement(top, 'child', {'error':'10','name':'WFH'})
subchild = SubElement(child, 'subchild')
subchild.text="Hi Subchild"
child = SubElement(top, 'child', {'error':'110','name':'W1FH'})
subchild = SubElement(child, 'subchild')
subchild.text="Hi Subchild"


print tostring(top)

f = open('xml_file.xml', 'w')
f.write(tostring(top))
f.close()
