class IncomesController < ApplicationController
  def index
    @incomes = Income.all
  end

  def new
    @property = Property.find(params[:property_id])
    @income = Income.new
  end

  def create
    @property = Property.find(params[:property_id])
    @income = @property.incomes.build(income_params)
    if @income.save
      redirect_to property_incomes_path(@property)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  private

  def income_params
    params.require(:income).permit(:rent, :key_money, :renewal_fee, :other_income).merge(property_id: params[:property_id])
  end
end
