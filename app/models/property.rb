class Property < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :building_type
  has_one_attached :image 
  
  with_options presence: true do
    validates :name
    validates :postal_code
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :city
    validates :street_number
    validates :building_type_id, numericality: { other_than: 1 }
  end

end
