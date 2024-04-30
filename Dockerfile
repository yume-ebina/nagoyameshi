# syntax = docker/dockerfile:1

FROM ruby:3.2.2

ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update &&\
    apt-get install -y \
    nodejs \
    build-essential \
    libpq-dev \
    postgresql-client \
    vim \
    yarn \
    imagemagick \
    libvips42
RUN gem install bundler -v '2.4.10'

RUN mkdir /myapp
WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

ADD . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
