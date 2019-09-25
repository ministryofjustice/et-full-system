FROM ruby:2.5.1-slim
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    git-core \
    libmcrypt-dev mcrypt \
    && rm -rf /var/lib/apt/lists/*

# Install jvm (small version from adoptopenjdk), grab specific version of pdftk jar file from gitlab
RUN mkdir -p /root/pdftk
WORKDIR /root/pdftk
RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    unzip \
    && curl --location -o jvm.tar.gz https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u222-b10_openj9-0.15.1/OpenJDK8U-jre_x64_linux_openj9_8u222b10_openj9-0.15.1.tar.gz \
    && mkdir -p /usr/lib/jvm \
    && tar --directory=/usr/lib/jvm -xvzf jvm.tar.gz \
    && rm jvm.tar.gz \
    && ln -s /usr/lib/jvm/jdk8u222-b10-jre/bin/java /etc/alternatives/java \
    && ln -s /etc/alternatives/java /usr/bin/java \
    && curl --location -o artifacts.zip https://gitlab.com/pdftk-java/pdftk/-/jobs/artifacts/v3.0.7/download?job=gradle \
    && unzip artifacts.zip \
    && mv build/libs/pdftk-all.jar /root/pdftk/pdftk.jar \
    && rm -rf build artifacts.zip \
    && apt-get remove -y curl unzip \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*
# pdftk is a 2 line bash script to just call the jar file, put it in the path
COPY pdftk /usr/local/bin
RUN chmod +x /usr/local/bin/pdftk
# PDFTK stuff done

RUN gem update --system
RUN gem install bundler
RUN mkdir -p /app
WORKDIR /app
CMD cd /app && tail -f /dev/null
