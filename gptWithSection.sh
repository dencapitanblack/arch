#!/bin/bash
#create a GUID Partition Table and section
fdisk /dev/sda << STDIO
g
n
1
2048
411647
n
2
411648
821247
t
2
4
n
4
9209856
14661631
n
5
14661632
16777182
n
3
9209855
w
STDIO
