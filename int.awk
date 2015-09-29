#!/usr/bin/awk -f
# 2015-09-29/DN: This was an awk attempt at formatting the output of ifconfig
# into something more readable.  You had to pipe the output of ifconfig to it 
# which I did using a separate script shown in the === comment below.
#=======================
##!/bin/sh
## old version
##ifconfig | egrep "inet |mtu "
#
#ifconfig | int.awk
#=======================


BEGIN { 
	ORS = ""
	ENET = 0 
	DEBUG = 0
	if (DEBUG == 1) {
		print ENET "\tBEGIN\n"
	}
	else {
		print "INT\tMAC\t\t\tIP ADDR\t\tMASK"
	}
}

/^en/ { 
	ENET = 1
	if (DEBUG == 1) {
		print ENET "\tmatch ^en \t" $0 "\n"
	}
	else {
		print "\n" $1 "\t"
	}
}

ENET == 1 && /ether/ { 
	if (DEBUG == 1) {
		print ENET "\tENET+ether \t" $0 "\n"
	}
	else {
		print $2 "\t"
	}
}

ENET == 1 && /inet / { 
	if (DEBUG == 1) {
		print ENET "\tENET+inet \t" $0 "\n"
	}
	else {
		print $2 "\t" $4
	}
}

ENET == 1 && /^[a-df-z]/ { 
	if (DEBUG == 1) {
		print ENET "\tnot ^e \t\t" $0 "\n"
		ENET = 0
	}
	else {
		ENET = 0
		print "\n"
	}
}

END {
	print "\n"
}
# en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
# 	ether 14:10:9f:e0:58:83
# 	inet6 fe80::1610:9fff:fee0:5883%en0 prefixlen 64 scopeid 0x4
# 	inet 192.168.1.11 netmask 0xffffff00 broadcast 192.168.1.255
# blah:
# 	blah
# 	blah
# 
