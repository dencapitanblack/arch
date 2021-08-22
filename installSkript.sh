#!/bin/bash
#create a GUID Partition Table
fdisk /dev/sda << EEOF
g
w
EEOF

