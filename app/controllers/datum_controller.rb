class DatumController < ApplicationController
  
  def edit
    @dataset = Dataset.find(params[:id])
    @data = Dataset.find(params[:id]).data.all
  end

  def update
    head :not_implemented unless params[:dataset_id]
    head :not_implemented unless params[:datum_type]
    
    if params[:datum_id]
      datum_id = params[:datum_id]
      if @d = Datum.find(datum_id)
        set_value(@d,params[:datum_type],params[:datum_value])
        render :text => @d.id.to_s
      else
        head 504
      end
    else  
      @d = Datum.new
      set_value(@d,params[:datum_type],params[:datum_value])
      dataset_id = params[:dataset_id]
      @d.dataset_id = dataset_id.to_i
      @d.save
      render :text => @d.id.to_s
    end

    
  end

  private
  def set_value datum, type, value
    case type
    when "pres"
      datum.pressure = value
    when "volt"
      datum.voltage = value
    when "amps"
      datum.amperage = value
    when "dark"
      datum.darkspace = value
    end
    datum.save
  end

  
end
