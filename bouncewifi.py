#!/usr/local/bin/python
import os
import time

os.system("networksetup -setairportpower en0 off")
time.sleep( 5 )
os.system("networksetup -setairportpower en0 on")

