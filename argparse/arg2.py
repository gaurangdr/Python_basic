import argparse
parse= argparse.ArgumentParser()
parse.add_argument("--verbosity", help="increase output verbosity")
arg = parse.parse_args()
if arg.verbosity:
	print 'Found'
