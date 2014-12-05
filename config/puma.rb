#!/usr/bin/env puma

directory '/home/deploy/rails_apps/invocations/current'
rackup "/home/deploy/rails_apps/invocations/current/config.ru"
environment 'production'

pidfile "/home/deploy/rails_apps/invocations/shared/tmp/pids/puma.pid"
state_path "/home/deploy/rails_apps/invocations/shared/tmp/pids/puma.state"
stdout_redirect '/home/deploy/rails_apps/invocations/shared/log/puma_access.log', '/home/deploy/rails_apps/invocations/shared/log/puma_error.log', true

threads 0,16

bind 'unix:///home/deploy/rails_apps/invocations/shared/tmp/sockets/puma.sock'
workers 0

preload_app!

