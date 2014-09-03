#!/usr/local/bin/python
import os
import time

print "networksetup -setairportpower en0 off"
os.system("networksetup -setairportpower en0 off")
time.sleep( 5 )
print "networksetup -setairportpower en0 on"
os.system("networksetup -setairportpower en0 on")


""" For possible inclusion in the futures:

	networksetup -setairportnetwork en0 RSGOps

"""
