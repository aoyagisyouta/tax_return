class IncomesController < ApplicationController
  def index
    @incomes = Income.all
    @expenses = Expense.all
    @grouped_expenses = @expenses.group_by { |expense| [expense.created_at.year, expense.created_at.month] }
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
    params.require(:income).permit(:year, :month, :rent, :key_money, :other_income).merge(property_id: params[:property_id])
  end
end
