require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "#total price" do
    product1 = Product.new(name: "Test1", price: 1230)
    product2 = Product.new(name: "Test2", price: 3210)

    item1 = OrderItem.new(product: product1, quantity: 4)
    item2 = OrderItem.new(product: product2, quantity: 5)

    order = Order.new(order_items: [item1, item2])

    assert_equal order.total_price, 4 * 1230 + 5 * 3210
  end

  test "#price_including_vat" do
    product = Product.new(name: "Test1", price: 1231)
    item = OrderItem.new(product: product, quantity: 4)
    order = Order.new(order_items: [item])
    assert_equal order.total_price_including_vat, ((1231 * 4) * 1.21).to_i
  end
end
