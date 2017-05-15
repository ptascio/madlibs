class BooksController < ApplicationController
  def index
    @books = Book.all
    render "index"
  end

  def show
    @book = Book.find(params[:id])
    redirect_to
  end
end
