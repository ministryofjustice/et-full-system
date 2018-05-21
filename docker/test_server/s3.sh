#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
cd /home/app/js/S3
exec npm start >>/var/log/s3.log 2>&1
