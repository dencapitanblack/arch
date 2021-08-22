#!/bin/bash
#create a GUID Partition Table
fdisk /dev/sda << STDIO
g
w
STDIO

fdisk /dev/sda << STDIO
n
1
2048
411647
w
STDIO

fdisk /dev/sda << STDIO
n
2
411648
821247
t
2
4
w
STDIO

fdisk /dev/sda << STDIO
n
3
821248 
9209855
w
STDIO

fdisk /dev/sda << STDIO
n
4
9209856
14661631
w
STDIO

fdisk /dev/sda << STDIO
n
5
14661632
16777182
w
STDIO

#End
