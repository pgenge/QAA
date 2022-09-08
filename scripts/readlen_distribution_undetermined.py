#!/usr/bin/env python

#import libs
import argparse
import matplotlib.pyplot as plt
import gzip

#argparse for calling options

def get_args():
    parser = argparse.ArgumentParser(description="get distribution of phred scores")
    parser.add_argument('-r1', '--read1', help = 'Read 1 File name', type = str, required = True)
    parser.add_argument('-r2', '--read2', help = 'Read 2 File name', type = str, required = True)
    parser.add_argument('-o1', '--output1', help = 'Output File name', type = str, required = True)
    parser.add_argument('-o2', '--output2', help = 'Output File name', type = str, required = True)
    return parser.parse_args()

#allows method calling
args = get_args() 

#new list
readlen_r1 = []

#read every 4th line and record the length of each line in a list

#read 1
linecount = 0
with gzip.open(args.read1, "rt") as file:
  for line in file:
    linecount += 1
    if linecount%4 == 2:
      line = line.strip('\n')
      length = len(line)
      readlen_r1.append(length)

#list for read 2
readlen_r2 = []

#read 2
linecount = 0
with gzip.open(args.read2, "rt") as file2:
  for line in file2:
    linecount += 1
    if linecount%4 == 2:
      line = line.strip('\n')
      length = len(line)
      readlen_r2.append(length)

#plot and save as png

plt.hist([readlen_r1, readlen_r2], label=['read1', 'read2'])
plt.yscale("log")
plt.legend()
plt.xlabel("Read Lengths")
plt.ylabel("Number of Reads at this Length")
plt.title('Read Length Distribution for Undetermined Read 1')

plt.savefig(args.output1) #.png
