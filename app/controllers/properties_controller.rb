class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
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

  # app/controllers/properties_controller.rb
  def show
    @property = Property.find(params[:id])

    # 入力されている収支・経費データから年を取得
    income_years = @property.incomes.pluck(:year).uniq
    expense_years = @property.expenses.pluck(:year).uniq

    # 収支と経費に含まれるすべての年を結合して一意にする
    @years = (income_years + expense_years).uniq.sort

    # @years が nil の場合は空配列を代入
    @years ||= []
  end

  private

  def property_params
    params.require(:property).permit(:name, :postal_code, :prefecture_id,
                                     :city, :street_number, :room_number, :building_type_id, :image).merge(user_id: current_user.id)
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
