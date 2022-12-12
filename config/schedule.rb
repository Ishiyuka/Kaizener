# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + '/environment')

set :path_env, ENV['PATH']

job_type :rake, "cd :path && PATH=':path_env' :environment_variable=:environment bundle exec rake :task --silent :output"

# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development

#railsアプリフォルダ内の./log/cron.logにログが出力されるようにする記述
set :output, "#{Rails.root}/log/cron.log"

# cronを実行する環境変数をセット
set :environment, rails_env


every 1.day, at: '9am' do
  rake 'remind_action:reminder'
end