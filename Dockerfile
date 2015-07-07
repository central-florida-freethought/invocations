FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy libpq-dev

RUN mkdir -p /usr/src/app
RUN mkdir /usr/src/app/log
RUN mkdir /usr/src/app/tmp

WORKDIR /usr/src/app
COPY Gemfile /usr/src/app/
COPY Gemfile.lock /usr/src/app/
RUN bundle install --deployment --without development test

COPY . /usr/src/app
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
EXPOSE 9292
RUN bundle exec rake assets:precompile
CMD ["bundle", "exec", "puma", "-C", "config/docker-puma.rb", "-d"]
