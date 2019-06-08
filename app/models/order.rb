class Order < ApplicationRecord
  has_many :order_items, inverse_of: :order
end
