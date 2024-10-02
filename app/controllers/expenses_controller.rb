class ExpensesController < ApplicationController
  def new
    @property = Property.find(params[:property_id])
    @expense = Expense.new
  end

  def create
    @property = Property.find(params[:property_id])
    @expense = @property.expenses.build(expense_params)
    if @expense.save
      redirect_to property_path(@property)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:year, :month, :taxes, :loan_interest_rate, :management_fee, :brokerage,
                                    :advertising, :premium, :depreciation, :repair_cost, :other_expenses)
  end
end
