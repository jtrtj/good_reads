class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.includes(:reviews).find(params[:id])
  end
end
