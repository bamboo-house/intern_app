class ArticlesController < ApplicationController
  def index
    #scrapingsテーブルとreg_groupsテーブルのなかで紐づいている情報のみを取り出す
    @datas = Scraping.where.not(reg_group_id: nil).page(params[:page]).per(10)
  end
end
