namespace :auto_scraping do
  task auto_scraping_task: :environment do
    #自動でスクレイピング
    Scraping.scrape_blueship
    Scraping.scrape_moshicom
    Scraping.update_reg_group_id
  end
end
