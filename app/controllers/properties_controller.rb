class PropertiesController < ApplicationController
  def index
    @properties = Property.all 
  end

  def new 
    @property = Property.new 
  end

  def create 
    @property = Property.new(property_params)
    if @property.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
    @property = Property.find(params[:id])
  end

  def update
    property = Property.find(params[:id])
    property.update(property_params)
    redirect_to root_path
  end

  private 
  def property_params
    params.require(:property).permit(:name, :postal_code, :prefecture_id,
    :city, :street_number, :room_number, :building_type_id, :image).merge(user_id: current_user.id)
  end
end
