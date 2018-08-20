FROM ruby:2.5.1

RUN apt-get update
RUN apt-get install libmcrypt4 libmcrypt-dev -y
RUN apt-get install pdftk -y

RUN mkdir /workspace
ADD Gemfile /workspace/Gemfile
ADD Gemfile.lock /workspace/Gemfile.lock
WORKDIR /workspace

RUN bundle install
CMD cucumber