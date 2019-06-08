class OrderItem < ApplicationRecord
  belongs_to :product, inverse_of: :order_items
  belongs_to :order, inverse_of: :order_items

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def total_price
    product.price * quantity
  end
end
