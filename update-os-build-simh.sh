#!/bin/sh

# this will copied onto and run on the host that's being installed
# all that should be there is the base OS (must have git client)

# must run as root, obviously

set -v

date
# Begin with the Google standard Ubuntu 18.04 LTS (not the minimal)
#

# if you don't do this then a lot of the application packages won't install properly
# beside, its always a good idea to update+upgrade immediately after installation
sudo apt-get --yes update
sudo apt-get --yes upgrade

# you will need these packages to build the emulator
sudo apt-get --yes install build-essential unzip
# for video support
sudo apt-get --yes install libsdl2-dev
# for ethernet
sudo apt-get --yes libpcap-dev

#get the simh package and unpack
wget https://github.com/simh/simh/archive/master.zip
unzip master.zip
# creates a simh-master dir
cd simh-master

make pdp11


# emulator is in BIN/pdp11

date

# TODO 
# get and unpack V6 tap
# disk prep
# build etc
# follow http://gunkies.org/wiki/Installing_Unix_v6_(PDP-11)_on_SIMH




