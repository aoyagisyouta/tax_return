class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.integer :rent, null: false 
      t.integer :key_money, null:false 
      t.integer :renewal_fee, null:false
      t.integer :other_income, null:false 
      t.references :property_id, null:false
      t.timestamps
    end
  end
end
