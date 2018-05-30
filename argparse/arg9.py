import argparse
parser = argparse.ArgumentParser()
parser.add_argument('-c', action='append', nargs = 2)
args = parser.parse_args()

print("~ C: {}".format(args.c))
