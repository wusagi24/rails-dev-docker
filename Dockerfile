FROM ruby:latest

RUN set -x && \
  apt-get update && apt-get upgrade -y && \
  apt-get install -y \
    sudo \
    vim

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get upgrade -y && \
  apt-get install -y \
    nodejs \
    build-essential \
    yarn

RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN groupadd rails && \
  useradd -m -g rails -s /bin/bash rails && \
  echo "rails ALL=NOPASSWD: ALL" >> /etc/sudoers

USER rails

RUN gem install bundler rails
