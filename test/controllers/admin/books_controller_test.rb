require "test_helper"

class Admin::BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @admin = users(:admin)
    sign_in @admin
  end

  test "should get index" do
    get admin_books_url
    assert_response :success
  end

  test "should show book" do
    get admin_book_url(@book)
    assert_response :success
  end

  test "should get new" do
    get new_admin_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post admin_books_url, params: { book: { title: "New Book", author: "Author", price: 10, stock: 5, description: "Desc" } }
    end
    assert_redirected_to admin_book_url(Book.last)
  end

  test "should get edit" do
    get edit_admin_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch admin_book_url(@book), params: { book: { title: "Updated Title" } }
    assert_redirected_to admin_book_url(@book)
    @book.reload
    assert_equal "Updated Title", @book.title
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete admin_book_url(@book)
    end
    assert_redirected_to admin_books_url
  end
end
