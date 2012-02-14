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

  # GET /datasets/todo
  def todo
    all = get_permutations
    cur = get_current_datasets_names
    @todo = all-cur
  end

  # POST /datasets
  def create
    @dataset = Dataset.new(params[:dataset])
    @dataset.status = 0 # 0: incomplete
    @dataset.user_id = session[:user_id]
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
    @dataset.comment = params[:comment]
    @dataset.status = 2
    @dataset.save

    redirect_to datasets_path
  end

  # PUT /datasets/1/approve
  def approve
    @dataset = Dataset.find(params[:id])
    @dataset.status = 3
    @dataset.save

    redirect_to datasets_path
  end

  private

  def get_permutations
    geometries = []
    materials = []

    geometries << 'Cone'
    geometries << 'Disc'
    geometries << 'Sphere'
    geometries << 'Point'

    materials << 'Aluminum'
    materials << 'Copper'
    materials << 'Graphite'
    materials << 'Stainless Steel'

    setups = []

    materials.each do |m1|
      geometries.each do |g1|
        materials.each do |m2|
          geometries.each do |g2|
            setups << m1+' '+g1+' PN '+m2+' '+g2
          end
        end
      end
    end

    return setups
  end

  def get_current_datasets_names
    datasets = []
    Dataset.all.each do |d|
      datasets << d.name
    end
    return datasets
  end


end
