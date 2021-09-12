#!/bin/sh
rm -i /var/lib/dpkg/info/$1.postinst
rm -i /var/lib/dpkg/info/$1.prerm
rm -i /var/lib/dpkg/info/$1.postrm

