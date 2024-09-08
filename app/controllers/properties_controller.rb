class PropertiesController < ApplicationController
  def index
    @properties = Property.all 
  end

  def new 
    @property = Property.new 
  end

  def create 
    Property.create(property_params)
    redirect_to '/'
  end

  private 
  def property_params
    params.require(:property).permit(:name, :postal_code, :prefecture_id,
    :city, :street_number, :room_number, :building_type_id, :image).merge(user_id: current_user.id)
  end
end
