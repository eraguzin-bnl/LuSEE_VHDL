#!/usr/bin/python
import sys
import os
print (os.path.join(os.getcwd(), 'labview_out.txt'))
file1 = open(os.path.join(os.getcwd(), 'labview_out.txt'), 'r')
file2 = open(os.path.join(os.getcwd(), 'data_fixed.txt'), 'a+')
Lines = file1.readlines()

for len, i in enumerate(Lines):
    file2.write(f'{int(i):08x}')
    file2.write('\n')

print("Done")
