# syntax = docker/dockerfile:1

FROM ruby:3.2.2

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

RUN apt-get update &&\
    apt-get install -y \
    nodejs \
    build-essential \
    libpq-dev \
    postgresql-client \
    vim
RUN gem install bundler -v '2.4.10'

RUN mkdir /myapp
WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

ADD . /myapp
