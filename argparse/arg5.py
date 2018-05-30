import argparse

parser = argparse.ArgumentParser(description='Example with long option names')

parser.add_argument('--noarg', action="store_true", default=False)
parser.add_argument('--witharg', action="store")
parser.add_argument('--witharg2', action="store", dest="witharg2", type=int)

arg =  parser.parse_args([ '--noarg', '--witharg', 'val', '--witharg2', '3' ])

print arg.noarg, arg.witharg, arg.witharg2

print parser.parse_args([ '--noarg', '--witharg', 'val', '--witharg2', '3' ])
