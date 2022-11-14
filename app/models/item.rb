class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9_999_999 }
  validates :area_id, :category_id, :charge_id, :condition_id, :delivery_id, numericality: { other_than: 1 } 
end
