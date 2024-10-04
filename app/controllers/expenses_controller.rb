class ExpensesController < ApplicationController
  before_action :set_property
  before_action :set_expense, only: [:edit, :update]

  def new
    @expense = Expense.new
  end

  def create
    @expense = @property.expenses.build(expense_params)
    if @expense.save
      redirect_to property_path(@property), notice: '経費が作成されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      redirect_to property_path(@property), notice: '経費が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def set_expense
    @expense = @property.expenses.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:year, :month, :taxes, :loan_interest_rate, :management_fee, :brokerage,
                                    :advertising, :premium, :depreciation, :repair_cost, :other_expenses)
  end
end
