require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { author: @book.author, description: @book.description, price: @book.price, stock: @book.stock, title: @book.title } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, description: @book.description, price: @book.price, stock: @book.stock, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end

  # 🔹 Your custom tests (now inside the class)
  test "should filter books by title with q param" do
    get books_url(q: @book.title)
    assert_response :success
    assert_select "td", text: @book.title
  end

  test "should require authentication for new" do
    sign_out :user if defined?(sign_out)
    get new_book_url
    assert_redirected_to new_user_session_url
  end

  test "should require authentication for create" do
    sign_out :user if defined?(sign_out)
    post books_url, params: { book: { title: "Test", author: "Author", price: 10, stock: 5, description: "Desc" } }
    assert_redirected_to new_user_session_url
  end

  test "should require authentication for edit" do
    sign_out :user if defined?(sign_out)
    get edit_book_url(@book)
    assert_redirected_to new_user_session_url
  end

  test "should require authentication for update" do
    sign_out :user if defined?(sign_out)
    patch book_url(@book), params: { book: { title: "Updated" } }
    assert_redirected_to new_user_session_url
  end

  test "should require authentication for destroy" do
    sign_out :user if defined?(sign_out)
    delete book_url(@book)
    assert_redirected_to new_user_session_url
  end

  test "should permit category_ids in book_params" do
    sign_in users(:one) if defined?(sign_in)
    patch book_url(@book), params: { book: { category_ids: [ 1, 2 ] } }
    assert_redirected_to book_url(@book)
  end
end
# 🔹 End of your custom test s
