#!/bin/bash

#clean dist files
eclean-dist

#clean binary package files
eclean-pkg

#remove all kernel files except last 3
eclean-kernel -n 3

#discard root partition on ssd.
# MAKE SURE SSD IS SAFE TO DISCARD FIRST!!!!!!
/sbin/fstrim --all

