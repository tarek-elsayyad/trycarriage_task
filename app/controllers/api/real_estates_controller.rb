class Api::RealEstatesController < ApplicationController
  before_action :set_real_estate, only: [:show, :update, :destroy]

  # GET /real_estates
  def index
    params[:page] = params[:page] || 1
    params[:per_page] = params[:per_page] || 10
    
    @real_estates = RealEstate.page(params[:page]).per(params[:per_page])
    render action: "/index/success", status: :ok
  end

  # GET /real_estates/1
  def show
    render action: "/show/success", status: :ok
  end

  def create
    @real_estate = RealEstate.new(real_estate_params)

    if @real_estate.save
      render action: "/create/success", status: :created
    else
      render action: "/create/errors", status: :unprocessable_entity
    end
  end

  # PATCH/PUT /real_estates/1
  def update
    if @real_estate.update(real_estate_params)
      render action: "/update/success", status: :ok
    else
      render action: "/update/errors", status: :unprocessable_entity
    end
  end

  # DELETE /real_estates/1
  def destroy
    if @real_estate.destroy
      render action: "/destroy/success", status: :ok
    else
      render action: "/destroy/errors", status: :unprocessable_entity
    end
  end

  def search

    params[:page] = params[:page] || 1
    params[:per_page] = params[:per_page] || 10

    @real_estates = RealEstate.price_from(params[:price_from])
                              .price_to(params[:price_to])
                              .area_from(params[:area_from])
                              .area_to(params[:area_to])
                              .real_estate_building_type(params[:building_type].try(:capitalize))
                              .page(params[:page])
                              .per(params[:per_page])
                              
    render action: "/search/success", status: :ok
  end

  def populate_csv
    populate_csv_in_background(params[:file].path)
    render json: {message: "your file will be populated in background"},  status: :ok
  end

  

  private
  
    def populate_csv_in_background(file_path)
      @real_estates = SmarterCSV.process(params[:file].path, {:key_mapping => {street: :street,city: :city,zip: :zip,state: :state,beds: :beds_number,baths: :baths_number, sq__ft: :square_feet,type: :building_type,sale_date: :sale_date, price: :price,latitude: :latitude,longitude: :longitude}, :row_sep =>  :auto, :chunk_size => 100}) do |chunk|
        begin      
          RealEstate.delay.import(chunk)
        rescue ActiveRecord::RecordInvalid => e
          puts e
        end
      end
    end

    def set_real_estate

      begin      
        @real_estate = RealEstate.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @real_estate = RealEstate.new
        @real_estate.errors.add(:id, e.message)
        render action: '/show/errors', status: :unprocessable_entity
      end
    end

    def real_estate_params
      params.require(:real_estate).permit(:street, :city, :zip, :state, :beds_number, :baths_number, :square_feet, :building_type, :sale_date, :price, :latitude, :longitude)
    end
end
