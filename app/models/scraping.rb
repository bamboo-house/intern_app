class Scraping < ApplicationRecord
  validates :group_name, presence: true, length: {maximum: 50}
  validates :event_title, length: {maximum: 255}
  belongs_to :reg_group, optional: true

  #blueshipページをスクレイピングしてデータベースに入れる
  def self.scrape_blueship
    agent = Mechanize.new
    for i in 0..10 #ページネーションに対応させている
      #スクレイピング(blueship)Mechanizeを用いる
      current_page = agent.get("https://blueshipjapan.com/search/event/catalog?area=0&text_date=&date=1&text_keyword=&cancelled=0&cancelled=1&order=desc&per page=#{18*i}")

      #欲しいタグ情報を取り出す
      event_titles = current_page.search("h2.event_title a")
      group_names = current_page.search(".crew_info p") 

      #スクレイピングした情報をデータベースに入れる  
      Scraping.data_save(event_titles, group_names, event_titles)
    end
  end

  #moshicomのページをスクレイピングしてデータベースに入れる
  def self.scrape_moshicom
    #スクレイピング(moshicom)javascriptなのでseleniumを用いる
    driver = Selenium::WebDriver.for :chrome
    driver.get("https://moshicom.com/search/?s=3&keyword=&event_start_date=&event_end_date=&entry_status=yes&except_eventup=no&scale=0&disciplines%5B%5D=11&wanted%5B%5D=999&day_entry=no&measurement=no&user_id=0&search_type=0&recommend_event=true&recommend_course=true&recommend_facility=true&mode=1&l=20&o=0&m=1")

    #欲しいタグ情報を取り出す
    event_titles = driver.find_elements(:xpath, '//*[@id="event_search"]/div/div/section/div/div/h3/a')
    group_names = driver.find_elements(:xpath, '//*[@id="event_search"]/div/div/section/div/div/div/dl/dd/div/h4/a')

    #スクレイピングした情報をデータベースに入れる
    Scraping.data_save(event_titles, group_names, event_titles)
    driver.quit
  end
  
  #reg_group_idをreg_groupsテーブルに基づいて紐付けする
  def self.update_reg_group_id
    count = RegGroup.count
    for n in 1..count
      current_data = RegGroup.find(n)
      update = self.where(group_name: current_data.group_name)
      #新しく団体を登録したときでも紐付けされるようにする
      update.update_all(reg_group_id: current_data.id) unless update.update_all(reg_group_id: current_data.id).present?
    end
  end
end
