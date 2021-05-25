# Rails.rootを使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")
# cronを実行する環境変数
rails_env = ENV['RAILS_ENV'] || :development
# cronを実行する環境変数をセット
set :environment, rails_env
# cronログを吐き出す場所
set :output, "#{Rails.root}/log/cron.log"

# ジョブの実行環境の指定
set :environment, :development

#毎日7:00にスクレイピングを実行する
# every 1.minutes
every 1.day, :at => '7:00' do
  rake 'auto_scraping:auto_scraping_task'
end