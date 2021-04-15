FROM ruby:2.7.0

RUN curl -SL https://deb.nodesource.com/setup_11.x | bash
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs default-mysql-client yarn

RUN gem install bundler

RUN mkdir /novel_app
ENV APP_ROOT /novel_app
WORKDIR $APP_ROOT

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

ENV LANG C.UTF-8

RUN bundle install
ADD . $APP_ROOT

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]