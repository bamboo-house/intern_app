class ArticlesController < ApplicationController
  def index
    @datas = Scraping.where.not(reg_group_id: nil).all.page(params[:page]).per(10)
    
    @reg = RegGroup.all
  end
end
