class IncomesController < ApplicationController
  before_action :set_property
  before_action :set_income, only: [:edit, :update]

  def new
    @income = Income.new
  end

  def create
    @income = @property.incomes.build(income_params)
    if @income.save
      redirect_to property_path(@property), notice: '収入が作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @income.update(income_params)
      redirect_to yearly_financials_property_path(@property, year: @income.year)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def set_income
    @income = @property.incomes.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:year, :month, :rent, :key_money, :other_income).merge(property_id: params[:property_id])
  end
end
