class ArticlesController < ApplicationController
  def index
    @data = Scraping.where.not(reg_group_id: nil)
    
    @reg = RegGroup.all
  end
end
