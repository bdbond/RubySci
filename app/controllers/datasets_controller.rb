class DatasetsController < ApplicationController
  def new
    @dataset = Dataset.new
  end

  def index
    @datasets = Dataset.all
  end

  def create
    if @dataset = Dataset.create(params[:dataset])
      redirect_to "#",notify:"Success!"
    else
      flash.now[:error] = "Failed"
      render action: 'new'
    end
  end

  

end
