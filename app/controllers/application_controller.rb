class ApplicationController < ActionController::Base
  helper_method :current_order

  private

  def current_order
    @current_order ||= Order.includes(order_items: :product)
                            .where(id: session[:order_id])
                            .first_or_initialize
  end
end
