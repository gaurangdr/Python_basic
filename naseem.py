try:
    import xml.etree.ElementTree as ET
    import argparse
    import os
except ImportError:
    print("Import Error")
finally:
    print("Done")

base_path = os.path.dirname(os.path.realpath(__file__))
print(base_path)
#xml_file = os.path.join(base_path,"output.xml") 

tree = ET.parse('output.xml')

root = tree.getroot()

new_product = ET.SubElement(root,"Product",attrib={"id":"4"})

new_product_name = ET.SubElement(new_product,"name")
new_product_desc = ET.SubElement(new_product,"description")
new_product_cost = ET.SubElement(new_product,"cost")

new_product_name.text = "python tshirt"
new_product_desc.text = "These tshirts are suitable for every man"
new_product_cost.text = 32
#fi = open('temp.xml','w')
tree.write(xml_file)
#fi.close()
