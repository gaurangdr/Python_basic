import argparse

parser = argparse.ArgumentParser()

#parser.add_argument('--noarg', action="store_true", default=False)
parser.add_argument('--config', action="store")
#parser.add_argument('--witharg2', action="store", dest="witharg2", type=int)

arg =  parser.parse_args()

print arg.config

