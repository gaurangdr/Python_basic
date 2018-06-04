import csv

name = ['first', 'last']
data = ['gaurang', 'rathod']
with open('some.csv', 'wb') as f:
    writer = csv.writer(f)
    writer.writerows('first')
    writer.writerows(data)
f.close()
