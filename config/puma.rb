#!/usr/bin/env puma

APP_NAME = 'invocations'
WORKING_DIRECTORY = "/home/deploy/rails_apps/#{APP_NAME}"

directory "#{WORKING_DIRECTORY}/current"
rackup "#{WORKING_DIRECTORY}/current/config.ru"
environment ENV['RAILS_ENV'] || 'production'

pidfile "#{WORKING_DIRECTORY}/shared/tmp/pids/puma.pid"
state_path "#{WORKING_DIRECTORY}/shared/tmp/pids/puma.state"
stdout_redirect "#{WORKING_DIRECTORY}/shared/log/puma_access.log",
                "#{WORKING_DIRECTORY}/shared/log/puma_error.log",
                true
bind "unix://#{WORKING_DIRECTORY}/shared/tmp/sockets/puma.sock"

threads 8,16
workers ENV['PUMA_WORKERS']
