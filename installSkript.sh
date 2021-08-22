#!/bin/bash
#create a GUID Partition Table
fdisk /dev/sda << STDIO
g
w
STDIO

read -p "Press Enter to continue"

fdisk /dev/sda << STDIO
n
1
2048
411647
w
STDIO

read -p "Press Enter to continue"

fdisk /dev/sda << STDIO
n
2
411648
821247
w
STDIO

read -p "Press Enter to continue"

fdisk /dev/sda << STDIO
t
2
4
w
STDIO

read -p "Press Enter to continue"

fdisk /dev/sda << STDIO
n
3
821248 
9209855
w
STDIO

read -p "Press Enter to continue"

fdisk /dev/sda << STDIO
n
4
9209856
14661631
w
STDIO

read -p "Press Enter to continue"

fdisk /dev/sda << STDIO
n
5
14661632
16777182
w
STDIO

read -p "Press Enter to continue"

#End
