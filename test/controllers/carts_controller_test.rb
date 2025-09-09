require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @cart = carts(:one)
    @user.cart = @cart
    @user.save
  end

  test "should get show" do
    get cart_url
    assert_response :success
    assert_equal assigns(:cart), @user.cart
  end

  test "should redirect show when not signed in" do
    sign_out @user
    get cart_url
    assert_redirected_to new_user_session_path
  end
end
