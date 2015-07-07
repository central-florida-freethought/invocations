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
ENV DEVISE_SECRET 5404a817a80b8ba7d26de0f80f83134e8fe950bc9d0e4a0b082d0cbd375342d0f013da35b6f95c1b884ad7c6a221425f6ff4fbaf81d9d7e64f6cce56c0477786
ENV SECRET_KEY_BASE 48f96554c8e760e188d88b604854c95a2f217941ae5cb8d586f8ed836acfb9e8658b9baf3bab7a783dc0880cf32231638d60beafafb32a3194cd68c4e8cea08c
ENV DOMAIN_NAME invocationsonline.com
EXPOSE 9292
RUN bundle exec rake assets:precompile
CMD ["bundle", "exec", "puma", "-C", "config/docker-puma.rb", "-d"]
