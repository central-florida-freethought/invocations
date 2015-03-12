FROM rails:onbuild

ENV RAILS_VERSION 4.2.0

CMD ["rails", "server", "--bind", "0.0.0.0"]

