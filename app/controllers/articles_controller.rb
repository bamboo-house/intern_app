class ArticlesController < ApplicationController
  def index
    #それぞれのDBからデータを取り出す
    # scrape_data = Scraping.all
    # pregroup = RegGroup.all

    # #pre_groupsテーブルのレコード数
    # @count = pregroup.count

    # #moshicomとblueshipのデータのなかでpre_groupsに登録してあるデータだけをリスト化
    # all_pregroup = []
    # pregroup.each do |a|
    #   all_pregroup << a.group_name
    # end
    # @output = []
    # all_pregroup.each do |t|
    #   @output << scrape_data.where(group_name: t) if scrape_data.where(group_name: t).any?
    # end

    @data = Scraping.where.not(reg_group_id: nil)
    
    @reg = RegGroup.all
    
  end
end
