FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential nodejs npm nodejs-legacy libpq-dev

RUN mkdir /usr/src/app

WORKDIR /tmp
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --deployment

ADD . /usr/src/app
WORKDIR /usr/src/app
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
EXPOSE 9292
# RUN bundle exec rake assets:precompile
CMD ["bundle", "exec", "puma", "-C", "config/docker-puma.rb"]
