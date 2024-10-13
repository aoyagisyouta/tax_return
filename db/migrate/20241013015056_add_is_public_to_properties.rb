class AddIsPublicToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :is_public, :boolean, default: false, null: false
  end
end
