#!/bin/sh

# tape boot
## tape bootload file for emulator

cat <<EOF > tboot.ini
set cpu 11/40
set tm0 locked
attach tm0 dist.tap
attach rk0 rk0
attach rk1 rk1
attach rk2 rk2
d cpu 100000 012700
d cpu 100002 172526
d cpu 100004 010040
d cpu 100006 012740
d cpu 100010 060003
d cpu 100012 000777
g 100000
EOF

# get a bootable tape image
wget http://sourceforge.net/projects/bsd42/files/Install%20tapes/Research%20Unix/Unix-v6-Ken-Wellsch.tap.bz2
bunzip2 *.bz2
# put it in the right place for the emulator
mv Unix-v6-Ken-Wellsch.tap dist.tap

# do the tape boot
simh-master/BIN/pdp11 tboot.ini 
#
#
#
# do some manual magix - need a ^E

# disk boot
cat <<EOF > dboot.ini
set cpu 11/40
set tto 7b
set tm0 locked
attach tm0 dist.tap
attach rk0 rk0
attach rk1 rk1
attach rk2 rk2
dep system sr 173030
boot rk0
EOF

# disk boot
simh-master/BIN/pdp11 dboot.ini 

exit



   41  cat >>normal-boot.ini
   42  simh-master/BIN/pdp11 normal-boot.ini 
   43  more normal-boot.ini 
   44  simh-master/BIN/pdp11
   45  simh-master/BIN/pdp11 normal-boot.ini 
   46  clear
   47  simh-master/BIN/pdp11 normal-boot.ini 
   48  exit
   49  sudo shutdown -h now
   50  telnet localhost 5555
   51  last
   52  df
 53  telnet localhost 5555
   54  ls
   55  more normal-boot.ini 
   56  telnet localhost 5555
   57  ls
   58  more dboot.ini 
   59  more normal-boot.ini 
   60  ls
   61  more normal-boot.ini 
   62  ls -lastr
   63  simh-master/BIN/pdp11 normal-boot.ini 
   64  sudo shutdown -h now
   65  more normal-boot.ini 
   66  more *ini
   67  simh-master/BIN/pdp11 normal-boot.ini 
   68  history
   69  ps -ef
   70  shutdown -h now
   71  sudo shutdown -h now
   72  telnet localhost 5555
   73  dump
   74  vmstat
   75  simh-master/BIN/pdp11 normal-boot.ini 
   76  jobs
   77  ps -ef
   78  jobs
   79  sudo shutdown -h now
   80  cat /etc/passwd
   81  telnet localhost 5555
   82  ifconfig
   83  history
   84  simh-master/BIN/pdp11 normal-boot.ini 
   85  ls
   86  history
   87  simh-master/BIN/pdp11 normal-boot.ini 
   88  ps -ef
   89  sudo shutdown -h now
   90  ps -ef
   91  history
   92  simh-master/BIN/pdp11 normal-boot.ini 
   93  ps -ef 
   94  telnet localhost 5555
   95  ps -f
   96  ps -ef
   97  kill 9424
   98  ps -ef
   99  sudo apt-get update
  100  sudo apt-get upgrade
  101  echo "unix" | simh-master/BIN/pdp11 normal-boot.ini 
  102  simh-master/BIN/pdp11 normal-boot.ini 
  103  ps -ef
  104  simh-master/BIN/pdp11 normal-boot.ini 
  105  history
  106  more normal-boot.ini 
  107  cat >> normal-boot.ini
  108  cat normal-boot.ini
  109  simh-master/BIN/pdp11 normal-boot.ini 
  110  emacs normal-boot.ini 
  111  simh-master/BIN/pdp11 normal-boot.ini 
  112  more *.ini
  113  echo "unix\n" | simh-master/BIN/pdp11 normal-boot.ini 
  114  simh-master/BIN/pdp11 normal-boot.ini 
  115  emacs normal-boot.ini
  116  echo "unix\n" | simh-master/BIN/pdp11 normal-boot.ini 
  117  more normal-boot.ini
  118  emacs normal-boot.ini
  119  simh-master/BIN/pdp11 normal-boot.ini 
  120  emacs normal-boot.ini
  121  ip
  122  ip address
  123  simh-master/BIN/pdp11 normal-boot.ini 
  124  cat normal-boot.ini
  125  simh-master/BIN/pdp11 normal-boot.ini 
  126  sync
  127  shutdown -h now
  128  sudo shutdown -h now
  129  cat normal-boot.ini
  130  simh-master/BIN/pdp11 normal-boot.ini 
  131  simh-master/BIN/pdp11 normal-boot.ini  &
  132  ps -ef
133  kill 1707
  134  ls
  135  ls -alstr
  136  cp rk0 rk0.snapshot
  137  emacs normal-boot.ini
  138  sync
  139  sudo shutdown -h now
  140  simh-master/BIN/pdp11 normal-boot.ini
  141  ls
  142  ls -alstr
  143  simh-master/BIN/pdp11 normal-boot.ini
  144  ls -lastr
  145  cp rk0 rk0.snapshot
  146  cp rk1 rk1.snapshot
  147  cp rk2 rk2.snapshot
  148  sudo shutdown -h now
  149  history
  150  simh-master/BIN/pdp11 normal-boot.ini
  151  ls
  152  ls -l
  153  more tboot.ini
  154  file dist.tap 
  155  more update-os-build-simh.sh 
  156  ls
  157  ls a-sltr
  158  ls -altr
  159  history
  160  history > HIST-MAKE-PDP11-V6
