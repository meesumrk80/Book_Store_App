require "test_helper"

class CartItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @book = books(:one)
    sign_in @user
    @cart = @user.cart || @user.create_cart!
    @cart_item = @cart.cart_items.create!(book: @book, quantity: 1)
  end

  test "should add book to cart" do
    assert_difference("CartItem.count") do
      post cart_items_url, params: { book_id: books(:two).id }
    end
    assert_redirected_to cart_path
    follow_redirect!
    assert_match "Book added to cart.", response.body
  end

  test "should increment quantity if book already in cart" do
    assert_no_difference("CartItem.count") do
      post cart_items_url, params: { book_id: @book.id }
    end
    @cart_item.reload
    assert_equal 2, @cart_item.quantity
    assert_redirected_to cart_path
  end

  test "should not add book to cart if invalid" do
    post cart_items_url, params: { book_id: nil }
    assert_redirected_to book_path(nil)
    follow_redirect!
    assert_match "Unable to add book to cart.", response.body
  end

  test "should remove book from cart" do
    assert_difference("CartItem.count", -1) do
      delete cart_item_url(@cart_item)
    end
    assert_redirected_to cart_path(@cart)
    follow_redirect!
    assert_match "Book removed from cart.", response.body
  end
end
