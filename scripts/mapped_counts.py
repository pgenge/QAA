#!/bin/python

import argparse

def get_args():
    #positional arguments
    parser = argparse.ArgumentParser(description="demux")
    parser.add_argument('samfile', default=None, type=str, help='Specify input sam file from alignment.')
    parser.add_argument('outfile', default=None, type=str, help='Specify output file.')
    return parser.parse_args()

#allows method calling
args = get_args()

mapped = 0 
unmapped = 0

with open (args.samfile, "r") as file:
    for line in file:
        #pulling out the flag column but as a str but changing to int
        if not line.startswith("@"):
            line = line.split("\t")
            flag = line[1]
            flag = int(flag)
            if((flag & 256) != 256):
                if((flag & 4) != 4):
                    mapped += 1
                else:
                    unmapped += 1

mapped = str(mapped)
unmapped = str(unmapped)
file1 = open(args.outfile, "w")
map_un = ["Mapped\n", mapped, "\n", "Unmapped\n", unmapped, "\n"]
file1.writelines(map_un)
file1.close()