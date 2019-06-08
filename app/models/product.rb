class Product < ApplicationRecord
  validates :name, :price, :image, presence: true
  validates :name, :description, length: { maximum: 2048 }
  validates :price, numericality: { greater_than: 0 }

  has_many :order_items, inverse_of: :product
end
