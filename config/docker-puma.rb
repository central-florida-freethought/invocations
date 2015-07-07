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
# bind "unix://#{WORKING_DIRECTORY}/tmp/sockets/puma.sock"

threads 8,16
workers ENV['PUMA_WORKERS']
