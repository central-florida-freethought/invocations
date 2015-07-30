#!/usr/bin/env puma

WORKING_DIRECTORY = "/usr/src/app"

directory "#{WORKING_DIRECTORY}"
rackup "#{WORKING_DIRECTORY}/config.ru"
environment ENV['RAILS_ENV'] || 'production'

pidfile "#{WORKING_DIRECTORY}/tmp/pids/puma.pid"
state_path "#{WORKING_DIRECTORY}/tmp/pids/puma.state"
stdout_redirect "#{WORKING_DIRECTORY}/log/puma_access.log",
                "#{WORKING_DIRECTORY}/log/puma_error.log",
                true
bind "tcp://0.0.0.0:#{ENV['PUMA_PORT']}"

threads 8,16
workers ENV['PUMA_WORKERS']
