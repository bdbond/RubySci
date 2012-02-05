class DatasetsController < ApplicationController
  
  # GET /datasets/news
  def new
    @dataset = Dataset.new
  end

  # GET /datasets
  def index
    @datasets = Dataset.all
  end

  # GET /datasets***
  def index_of_interest
    @datasets = Dataset.where("marked_of_interest = ?",true)
  end

  # POST /datasets
  def create
    if @dataset = Dataset.create(params[:dataset])
      redirect_to edit_datum_path(@dataset.id),notify:"Success!"
    else
      flash.now[:error] = "Failed"
      render action: 'new'
    end
  end

  # DELETE /datasets/1
  def destroy
    if @dataset = Dataset.find(params[:id])
      @dataset.destroy
    end
    redirect_to datasets_path
  end


end
