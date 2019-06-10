class Order < ApplicationRecord
  has_many :order_items, inverse_of: :order

  def total_count
    order_items.sum(&:quantity)
  end

  def total_price
    order_items.sum(&:total_price)
  end

  def total_price_including_vat
    total_price + vat
  end

  def vat
    Libtooz::Vat.compute(country: :cz, amount: total_price)
  end
end
