FROM ruby:2.6.3

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       node.js \
                       default-mysql-client

RUN mkdir /novel_app
ENV APP_ROOT /novel_app
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT