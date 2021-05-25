class ArticlesController < ApplicationController
  def index
    @datas = Scraping.where.not(reg_group_id: nil).page(params[:page]).per(10)
  end
end
