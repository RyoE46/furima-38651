class Item < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ },
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :area_id, :category_id, :charge_id, :condition_id, :delivery_id, numericality: { other_than: 1 }

  has_one_attached :image
  belongs_to :user
  has_one    :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :charge
  belongs_to :condition
  belongs_to :delivery
end
