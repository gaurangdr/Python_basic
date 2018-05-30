import argparse
parse = argparse.ArgumentParser()
parse.add_argument("--x", type= int,help = "x should be int")
argv = parse.parse_args()
print argv.x * 2
