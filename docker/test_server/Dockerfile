FROM phusion/passenger-customizable:0.9.30
# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# If you're using the 'customizable' variant, you need to explicitly opt-in
# for features.
#
# N.B. these images are based on https://github.com/phusion/baseimage-docker,
# so anything it provides is also automatically on board in the images below
# (e.g. older versions of Ruby, Node, Python).
#
# Uncomment the features you want:
#
#   Ruby support
#RUN /pd_build/ruby-2.0.*.sh
#RUN /pd_build/ruby-2.1.*.sh
#RUN /pd_build/ruby-2.2.*.sh
RUN /pd_build/ruby-2.3.*.sh
#RUN /pd_build/ruby-2.4.*.sh
#RUN /pd_build/ruby-2.5.*.sh
#RUN /pd_build/jruby-9.1.*.sh
#   Python support.
#RUN /pd_build/python.sh
#   Node.js and Meteor standalone support.
#   (not needed if you already have the above Ruby support)
#RUN /pd_build/nodejs.sh

# ...put your own build instructions here...
RUN apt-get update && apt-get -y install pdftk tzdata postgresql gettext-base
RUN /pd_build/nodejs.sh

# ...put your own build instructions here...
RUN apt-get update && apt-get -y install pdftk tzdata postgresql

# Enable nginx and passenger
RUN rm -f /etc/service/nginx/down

# Enable the Redis service.
RUN rm -f /etc/service/redis/down



# Copy configs
RUN rm /etc/nginx/sites-enabled/default
ADD docker/test_server/webapp.conf /etc/nginx/sites-available/webapp.conf.template
ADD docker/test_server/env.conf /etc/nginx/main.d/webapp_env.conf

# Custom Services
RUN mkdir /etc/service/sidekiq_api
COPY docker/test_server/sidekiq_api.sh /etc/service/sidekiq_api/run
RUN chmod +x /etc/service/sidekiq_api/run

RUN mkdir /etc/service/sidekiq_et1
COPY docker/test_server/sidekiq_et1.sh /etc/service/sidekiq_et1/run
RUN chmod +x /etc/service/sidekiq_et1/run

RUN mkdir /etc/service/s3
COPY docker/test_server/s3.sh /etc/service/s3/run
RUN chmod +x /etc/service/s3/run

# Create the js directory for the s3 server
RUN mkdir -p /home/app/js; chown app:app /home/app/js

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /home/app/systems; chown app:app /home/app/systems
COPY --chown=app:app systems /home/app/systems
RUN bash -lc "cd /home/app/systems/et1 && bundle install --deployment"
RUN bash -lc "cd /home/app/js && git clone https://github.com/scality/S3.git && cd S3 && git checkout tags/GA7.2.0.4 && npm install"
WORKDIR /home/app/systems
