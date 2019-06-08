class Order < ApplicationRecord
  has_many :order_items, inverse_of: :order

  def total_price
    order_items.sum(&:total_price)
  end

  def total_price_including_vat
    total_price + vat
  end

  def vat
    ((21 * total_price) / 100).round
  end
end
