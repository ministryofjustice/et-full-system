FROM ruby:2.3.3-slim
RUN apt-get update && apt-get install -y \
    build-essential
RUN gem install bundler
RUN mkdir -p /app
WORKDIR /app