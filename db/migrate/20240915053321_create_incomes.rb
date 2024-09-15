class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.integer :rent 
      t.integer :key_money
      t.integer :other_income 
      t.references :property, null:false
      t.timestamps
    end
  end
end
