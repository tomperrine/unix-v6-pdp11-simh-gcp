# pdp-11-in-gcp
tooling to automagically create a PDP-11 using simh in GCP



You will need these files

tboot.ini - does the initial tape boot of UNIX, using the dist.tap file as the tape

dist.tap - get it here:
    http://sourceforge.net/projects/bsd42/files/Install%20tapes/Research%20Unix/Unix-v6-Ken-Wellsch.tap.bz2/download

dboot.ini - does the disk boot, after you've rebuilt the kernel



Follow the directions at http://gunkies.org/wiki/Installing_Unix_v6_(PDP-11)_on_SIMH



References


https://github.com/simh/simh/archive/master.zip
http://gunkies.org/wiki/Installing_Unix_v6_(PDP-11)_on_SIMH
https://sourceforge.net/projects/bsd42/files/Install%20tapes/Research%20Unix/Unix-v6-Ken-Wellsch.tap.bz2/download
http://doc.cat-v.org/unix/v6/operating-systems-lecture-notes/v6/doc/index.html
