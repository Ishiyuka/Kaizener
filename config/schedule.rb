require File.expand_path(File.dirname(__FILE__) + '/environment')
# Rails.rootを使用するために必要

set :path_env, ENV['PATH']
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数

set :environment, rails_env
# cronを実行する環境変数をセット

job_type :runner, "cd :path && PATH=':path_env' bin/rails runner -e :environment ':task' :output"
# job_type :rake, "cd :path && PATH=':path_env' :environment_variable=:environment bundle exec rake :task --silent :output"

set :output, "#{Rails.root}/log/cron.log"
#railsアプリフォルダ内の./log/cron.logにログが出力されるようにする記述

set :output, { error: 'log/cron_error.log' }

every 1.day, at: '9:00 am' do
  runner 'Plan.remind'
end