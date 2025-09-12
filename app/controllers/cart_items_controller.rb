class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = current_user.cart || current_user.create_cart!
    cart_items = cart.cart_items.find_or_initialize_by(book_id: params[:book_id])
    cart_items.quantity ||=0
    cart_items.quantity += 1
    if cart_items.save
      redirect_to cart_path, notice: "Book added to cart."
    else
      redirect_to books_path(params[:book_id]), alert: "Unable to add book to cart."
    end
  end

  def destroy
    cart_item = current_user.cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path(current_user.cart), notice: "Book removed from cart."
  end

  def update
    cart_item = current_user.cart.cart_items.find(params[:id])
    if cart_item.update(quantity: params[:quantity])
      redirect_to cart_path(current_user.cart), notice: "Cart updated."
    else
      redirect_to cart_path(current_user.cart), alert: "Unable to update cart."
    end
  end
end
