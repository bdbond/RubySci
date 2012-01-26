class DatasetsController < ApplicationController
  def new
    @dataset = Dataset.new
  end

  def index
    @datasets = Dataset.all
  end

  def index_of_interest
    @datasets = Dataset.where("marked_of_interest = ?",true)
  end

  def create
    if @dataset = Dataset.create(params[:dataset])
      redirect_to edit_datum_path(@dataset.id),notify:"Success!"
    else
      flash.now[:error] = "Failed"
      render action: 'new'
    end
  end

  

end
