import re
import os

f = open('test.txt','r')
strng = f.read()
#print strng
m = re.findall('\w+\sModule',strng)
print m
