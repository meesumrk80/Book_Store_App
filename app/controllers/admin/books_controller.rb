module Admin
  class BooksController < ApplicationController
    before_action :authenticate_user!   # Devise: must be logged in
    before_action :set_book, only: [ :show, :edit, :update, :destroy ]

    def index
      @books = policy_scope([ :admin, Book ])
      authorize([ :admin, Book ])
    end

    def show
      authorize([ :admin, @book ])
    end

    def new
      @book = Book.new
      authorize([ :admin, @book ])
    end

    def create
      @book = Book.new(book_params)
      authorize([ :admin, @book ])

      if @book.save
        redirect_to admin_books_path, notice: "Book created successfully"
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      authorize([ :admin, @book ])
    end

    def update
      authorize([ :admin, @book ])
      if @book.update(book_params)
        redirect_to admin_books_path, notice: "Book updated successfully"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      authorize([ :admin, @book ])
      @book.destroy
      redirect_to admin_books_path, notice: "Book deleted successfully"
    end

    private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :description, :image)
    end
  end
end
