require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  test "#total price" do
    product = Product.new(name: "Test", price: 1230)
    item = OrderItem.new(product: product, quantity: 4)
    assert_equal item.total_price, 4 * 1230
  end
end
