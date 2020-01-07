# unix-v6-pdp11-simh-gcp   (WAS pdp-11-in-gcp)
tooling to automagically create a PDP-11 using simh in GCP
(Renamed from pdp-11-i-gcp)

Stable version - 2020-01-06 - I don't expect to make any changes for the forseeable future.

This software creates a full functional UNIX v6 (1976) system running on
an emulated PDP-11 (using SIMH) in the Google Cloud (GCP).

This uses several scripts and configuration files. The run in one of four different contexts:
* The first set run on your local machine - only tested on MacOS, should run on any Linux as well
* The second set run on the Ubuntu instance and build and run SIMH
* The final two sets are a strange mix:
** They run as SIMH emulator commands, but are actually injected into the running v6 UNIX as shell commands

On your local machine:
* launch-pdp11.sh - The master script creates a place to run the SIMH emulator.
  * creates a GCP instance running Ubuntu
* copies the update-os-build-simh.sh script onto the instance and runs it
  * displays information at the end to tell the user how to complete the installation

Running in the Ububtu instance:
* update-os-build-simh.sh - gets SIMH PDP-11 emulator running in the instance
** updates Ubuntu installs all needed dependencies
** downloads, configures and builds SIMH for PDP-11
** copies the needed emulator *.ini files to the instance

At the end of this process you have a running Ubuntu system with a PDP-11 emulator ready to install v6 UNIX

The end of the launch-pdp11.sh script provides instructions on how to install V6 UNIX into the emulator. This erquires running three commands while logged into the GCP Ubuntu instance:

* simh-master/BIN/pdp11 tboot.ini - tape boot, copies minimal root filesystem on to the emulated RK disk
* simh-master/BIN/pdp11 buildunix.ini - uses expect hackery to do LOTS of customization of the kernel to support an RK disk (see http://gunkies.org/wiki/Installing_Unix_v6_(PDP-11)_on_SIMH for details)
* simh-master/BIN/pdp11 normalboot.ini - boots the fully functional PDP-11 with all software. Use this for all subsequent boots of the UNIX guest


# References
* https://github.com/simh/simh/archive/master.zip
* http://gunkies.org/wiki/Installing_Unix_v6_(PDP-11)_on_SIMH
* https://sourceforge.net/projects/bsd42/files/Install%20tapes/Research%20Unix/Unix-v6-Ken-Wellsch.tap.bz2/download
* http://doc.cat-v.org/unix/v6/operating-systems-lecture-notes/v6/doc/index.html

# TODO
Find a way to avoid the user interactions required to control-E and q the emulator
