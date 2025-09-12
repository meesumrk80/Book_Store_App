class OrdersController < ApplicationController
  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(cart: current_user.cart, total: current_user.cart.cart_items.sum { |item| item.book.price * item.quantity }, status: "pending")

    if @order.save
      # ✅ Option 1: clear items from current cart
      current_user.cart.cart_items.destroy_all

      # ✅ Option 2 (cleaner): give user a fresh cart
      # cart.destroy
      # current_user.create_cart!
      redirect_to @order, notice: "Order placed successfully!"
    else
      redirect_to cart_path, alert: "Unable to place order."
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
