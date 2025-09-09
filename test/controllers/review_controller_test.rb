require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @user = users(:one)
    @review_params = { content: "Great book!", rating: 5 }
    sign_in @user
  end

  test "should create review with valid params" do
    assert_difference("Review.count", 1) do
      post book_reviews_url(@book), params: { review: @review_params }
    end
    assert_redirected_to book_path(@book)
    follow_redirect!
    assert_match "Review submitted successfully.", response.body
  end

  test "should not create review with invalid params" do
    assert_no_difference("Review.count") do
      post book_reviews_url(@book), params: { review: { content: "", rating: nil } }
    end
    assert_redirected_to book_path(@book)
    follow_redirect!
    assert_match "Failed to submit review", response.body
  end

  test "should associate review with current user" do
    post book_reviews_url(@book), params: { review: @review_params }
    review = Review.last
    assert_equal @user, review.user
  end
end
