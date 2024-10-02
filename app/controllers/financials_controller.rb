class FinancialsController < ApplicationController
  before_action :set_property

  def yearly
    @year = params[:year].to_i

    # 特定のプロパティに対する特定の年の収支データを取得
    @incomes = @property.incomes.where(year: @year)
    @expenses = @property.expenses.where(year: @year)

    # 収入と経費の合計を計算
    @income_total = @incomes.sum { |income| income.rent + income.key_money + income.other_income }
    @expense_total = @expenses.sum do |expense|
      expense.taxes.to_i + expense.loan_interest_rate.to_i + expense.management_fee.to_i +
        expense.brokerage.to_i + expense.advertising.to_i + expense.premium.to_i +
        expense.depreciation.to_i + expense.repair_cost.to_i + expense.other_expenses.to_i
    end

    def show
      @property = Property.find(params[:id])
      # 入力されている収支・経費データから年を取得
      income_years = @property.incomes.pluck(:year).uniq
      expense_years = @property.expenses.pluck(:year).uniq
      # 収支と経費に含まれるすべての年を結合して一意にする
      @years = (income_years + expense_years).uniq.sort
    end

    # 純利益を計算
    @net_profit = @income_total - @expense_total
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end
end
