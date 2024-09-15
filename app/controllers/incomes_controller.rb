class IncomesController < ApplicationController
  def index
    @incomes = Income.all
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to property_income_index_path
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
