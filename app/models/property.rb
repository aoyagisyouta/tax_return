class Property < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :building_type
  has_one_attached :image
  belongs_to :user
  has_many :incomes, dependent: :destroy
  has_many :expenses, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'はXXX-XXXXの形式で入力してください。' }
  validates :prefecture_id, presence: true, numericality: { only_integer: true, greater_than: 1, message: 'を選択してください' }
  validates :city, presence: true, length: { maximum: 50 }
  validates :street_number, presence: true, length: { maximum: 50 }
  validates :room_number, length: { maximum: 50 }, allow_blank: true
  validates :building_type_id, presence: true, numericality: { only_integer: true, greater_than: 1, message: 'を選択してください' }
  validates :user_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :construction_date, presence: true
end
