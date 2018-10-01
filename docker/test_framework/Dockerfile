FROM ruby:2.5.1-slim
RUN apt-get update && apt-get install -y \
    build-essential \
    git-core \
    pdftk \
    libmcrypt-dev mcrypt \
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
CMD cd /app && tail -f /dev/null
