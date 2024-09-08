class Property < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :street_number
    validates :building_type_id
  end
end
