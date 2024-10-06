class PropertiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  before_action -> { check_user(@property) }, only: [:edit, :update, :destroy]
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
  end

  def update
    @property.update(property_params)
    redirect_to root_path
  end

  def destroy
    @property.destroy
    redirect_to root_path
  end

  def show
    @property = Property.find(params[:id])

    income_years = @property.incomes.pluck(:year).uniq
    expense_years = @property.expenses.pluck(:year).uniq

    @years = (income_years + expense_years).uniq.sort

    @years ||= []
  end

  private

  def property_params
    params.require(:property).permit(:name, :postal_code, :prefecture_id,
                                     :city, :street_number, :room_number, :building_type_id, :construction_date, :image).merge(user_id: current_user.id)
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
