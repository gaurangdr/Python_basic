import argparse

parser = argparse.ArgumentParser(description='Example with non-optional arguments')

parser.add_argument('count', action="store", type=int)
parser.add_argument('units', action="store")

arg = parser.parse_args()
print arg.count
print arg.units
