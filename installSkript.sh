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
812247
t
2
4
w
STDIO

