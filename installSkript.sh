#!/bin/bash

fdisk /dev/sda << EEOF
g
w

EEOF

