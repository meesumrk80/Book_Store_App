require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get categories_url
    assert_response :success
    assert_select "h1", "Categories"
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
    assert_select "h1", @category.name
  end
end
