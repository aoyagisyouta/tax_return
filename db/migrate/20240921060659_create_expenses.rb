class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.integer :year
      t.integer :month
      t.integer :taxes, null: false
      t.integer :loan_interest_rate
      t.integer :management_fee
      t.integer :brokerage
      t.integer :advertising
      t.integer :premium
      t.integer :depreciation
      t.integer :repair_cost
      t.integer :other_expenses
      t.references :property, null: false, foreign_key: true
      t.timestamps
    end
  end
end
