class DatasetsController < ApplicationController
  
  # GET /datasets/news
  def new
    @dataset = Dataset.new
  end

  # GET /datasets
  def index
    if status_code = params[:status]
      @datasets = Dataset.where("status=?",status_code)
    else
      @datasets = Dataset.all
    end
  end

  # POST /datasets
  def create
    @dataset = Dataset.new(params[:dataset])
    @dataset.status = 0 # 0: incomplete
    if @dataset.save
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

  # PUT /datasets/1/submit_for_approval
  def submit_for_approval
    @dataset = Dataset.find(params[:id])
    @dataset.status = 2
    @dataset.save

    redirect_to datasets_path
  end


end
