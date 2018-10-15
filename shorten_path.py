#!/usr/bin/python3

import sys
try:
    full = sys.argv[1].split('/')
except IndexError:
    print("~")
shortened = [ path[0] for path in full if len(path) > 0 ]

print('/'.join(shortened) + full[-1][1:])