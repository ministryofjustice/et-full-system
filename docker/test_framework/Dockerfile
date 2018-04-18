FROM ruby:2.3.3-slim
RUN apt-get update && apt-get install -y \
    build-essential \
    libav-tools \
    python \
    python-dev \
    python-pip && \
    pip install vnc2flv && \
    apt-get remove -y python-dev python-pip
RUN ln -s /usr/bin/avconv /usr/bin/ffmpeg
RUN gem update --system
RUN gem install bundler
RUN mkdir -p /app
WORKDIR /app
CMD tail -f /dev/null