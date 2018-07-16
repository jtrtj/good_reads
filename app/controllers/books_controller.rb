class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
    @highest_review = @book.highest_review
    @lowest_review = @book.lowest_review
  end
end
