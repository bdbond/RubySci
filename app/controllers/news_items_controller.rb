class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.all
  end
  
  def new
    @news_item = NewsItem.new
  end

  def create
    @news_item = NewsItem.new(params[:news_item])
    @news_item.user_id = 1
    if @news_item.save
      redirect_to "/", notice: "Success!"
    else
      redirect_to "/", notice: "Failure"
    end
  end
end
