#!/usr/bin/env python
import os
import time
import logging

logging.disable(logging.CRITICAL)
logging.basicConfig(level=logging.DEBUG, format='%(asctime)s - %(levelname)s - %(message)s')
logging.debug('start of program')

#print("networksetup -setairportpower en0 off")
logging.debug('networksetup -setairportpower en0 off')
os.system("networksetup -setairportpower en0 off")

logging.debug('waiting 5 seconds')
time.sleep( 5 )

#print("networksetup -setairportpower en0 on")
logging.debug('networksetup -setairportpower en0 on')
os.system("networksetup -setairportpower en0 on")

logging.debug('end of program')

""" For possible inclusion in the futures:

	networksetup -setairportnetwork en0 RSG

"""
