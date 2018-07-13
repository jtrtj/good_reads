class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @reviews = Review.where(book_id: params[:id])
  end
end
