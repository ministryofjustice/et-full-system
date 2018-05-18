#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
cd /home/app/systems/et1
export REDIS_DATABASE=1
export RAILS_ENV=local
export ASSET_HOST=dontcare
export HTTP_OPEN_TIMEOUT_S=15
export HTTP_READ_TIMEOUT_S=15
export REDIS_URL=redis://redis:6379/1
export SECRET_KEY_BASE=dsjeflsdshewje23q896edc7dsufhsekjh4321ueirdasy6890
export SMTP_HOSTNAME=smtp
export SMTP_PORT=1025
export JADU_API=http://api.et:3200/api/v1/
export AWS_ACCESS_KEY_ID=accessKey1
export AWS_SECRET_ACCESS_KEY=verySecretKey1
export S3_UPLOAD_BUCKET=et1bucket
export AWS_REGION=us-east-1
export AWS_ENDPOINT=http://s3.et:3200
export AWS_S3_FORCE_PATH_STYLE=true

exec /sbin/setuser app bundle exec sidekiq >>/var/log/sidekiq_et1.log 2>&1
