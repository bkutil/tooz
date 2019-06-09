class CartController < ApplicationController
  before_action :set_order
  before_action :set_item, only: [:add, :remove]

  def show
    @order_items = @order.order_items
    @total_price = @order.total_price
    @vat = @order.vat
    @total_price_including_vat = @order.total_price_including_vat
  end

  # Increment the quantity on the item. If the item is a new one, and not
  # loaded from a DB, it's default quantity is 0, so this will work as
  # expected. We just need to ensure it is saved.
  def add
    @item.increment(:quantity)
    @item.save!

    refresh
  end

  # Decrement the quantity on the item. If the item quantity is only 1, delete
  # the item instead. This will cause the whole cart row to disappear.
  def remove
    if @item.quantity == 1
      @item.destroy!
    else
      @item.decrement(:quantity)
      @item.save!
    end

    refresh
  end

  # Called when the whole cart item row is deleted.
  def drop_item
    @order.order_items.find(params[:id]).destroy

    refresh
  end

  private

  # When combined with remote: true on links, this will force the browser to
  # reload the page when the operation completes. Real world apps can use
  # code stored on the frontend to update the page contents.
  def refresh
    render js: "location.reload()"
  end

  # As soon as add/remove is called, save the order into the database and into
  # user's session - it will be looked up and loaded on the next request.
  def set_order
    @order = current_order

    if @order.new_record?
      @order.save!
      session[:order_id] = @order.id
    end
  end

  # Find the item in the cart by product id, so we can create it or update the
  # quantity on it. If not found, initialize a new one.
  def set_item
    @item = @order.order_items
                 .where(product_id: params[:product_id])
                 .first_or_initialize(order_id: @order.id)
  end
end
