#!/usr/bin/env puma

directory '/usr/src/app'
rackup "/usr/src/app/config.ru"
environment 'production'

pidfile "/usr/src/app/tmp/pids/puma.pid"
state_path "/usr/src/app/tmp/pids/puma.state"
stdout_redirect '/usr/src/app/log/puma_access.log', '/usr/src/app/log/puma_error.log', true

threads 0,16

