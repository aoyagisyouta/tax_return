class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :name, null: false 
      t.string :postal_code, null: false 
      t.integer :prefecture_id, null:false
      t.string :city, null:false
      t.string :street_number, null:false
      t.string :room_number
      t.integer :building_type_id, null:false
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
