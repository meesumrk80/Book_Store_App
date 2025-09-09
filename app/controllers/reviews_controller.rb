class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to book_path(@book), notice: "Review submitted successfully."
    else
      redirect_to book_path(@book), alert: "Failed to submit review. Please ensure all fields are filled correctly."
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user == current_user || current_user.admin?
      @review.destroy
      redirect_to book_path(@review.book), notice: "Review deleted successfully."
    else
      redirect_to book_path(@review.book), alert: "You are not authorized to delete this review."
    end
  end

  def edit
    @review = Review.find(params[:id])
    unless @review.user == current_user || current_user.admin?
      redirect_to book_path(@review.book), alert: "You are not authorized to edit this review."
    end
  end
  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
