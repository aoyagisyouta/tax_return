class Expense < ApplicationRecord
  belongs_to :property

  def total
    taxes.to_i + loan_interest_rate.to_i + management_fee.to_i + brokerage.to_i +
      advertising.to_i + premium.to_i + depreciation.to_i + repair_cost.to_i +
      other_expenses.to_i
  end
end
