#!/bin/bash

# Put you code here

#With given passwd file do following:

#a. Create copy of passwd file to passwd_new. ❗ Do all modifications on passwd_new file
cat passwd > passwd_new

#b. Change shell for user saned from /usr/sbin/nologin to /bin/bash using AWK
awk -F: 'BEGIN {OFS=":"} $1 == "saned" { $7 = "/bin/bash" } { print }' passwd_new > passwd_tmp
mv passwd_tmp passwd_new

#c. Change shell for user avahi from /usr/sbin/nologin to /bin/bash using SED
sed -i '/avahi:/s/\/usr\/sbin\/nologin/\/bin\/bash/' passwd_new

#d. Save only 1-st 3-dr 5-th 7-th columns of each string based on : delimiter
awk -F: '{ print $1 ":" $3 ":" $5 ":" $7 }' passwd_new > passwd_tmp
mv passwd_tmp passwd_new

#e. Remove all lines from file containing word daemon
sed -i '/daemon/d' passwd_new

#f. Change shell for all users with even UID to /bin/zsh
awk -F: 'BEGIN {OFS=":"} $2 % 2 == 0 { $4 = "/bin/bash" } {print}' passwd_new > passwd_tmp
mv passwd_tmp passwd_new

