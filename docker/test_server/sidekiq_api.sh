#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
cd /home/app/systems/api
export REDIS_DATABASE=2
exec /sbin/setuser app bundle exec sidekiq >>/var/log/sidekiq_api.log 2>&1
