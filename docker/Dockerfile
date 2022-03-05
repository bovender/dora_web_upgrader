# Adapted from: https://gist.github.com/nvick/96c22b18b6cb31fa458fafba32fa000f
# See also: https://hint.io/blog/rails-development-with-docker
FROM ruby:3.1

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
  build-essential \
  locales \
  git \
  netcat \
  vim \
  sudo

ARG UID=1000
ENV UID $UID
ARG GID=1000
ENV GID $GID
ARG USER=ruby
ENV USER $USER

RUN groupadd -g $GID $USER && \
  useradd -u $UID -g $USER -m $USER && \
  usermod -p "*" $USER && \
  usermod -aG sudo $USER && \
  echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers.d/50-$USER

ENV LANG C.UTF-8

ENV BUNDLE_PATH /gems
ENV BUNDLE_HOME /gems

ENV GEM_HOME /gems
ENV GEM_PATH /gems

ENV PATH /gems/bin:$PATH

RUN mkdir -p "$GEM_HOME" && chown $USER:$USER "$GEM_HOME"
RUN mkdir -p /app && chown $USER:$USER /app

WORKDIR /app

RUN mkdir -p public/packs && chown $USER:$USER public/packs
RUN mkdir -p tmp/cache && chown $USER:$USER tmp/cache

USER $USER
RUN gem install bundler
