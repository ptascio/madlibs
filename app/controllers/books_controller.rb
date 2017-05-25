class BooksController < ApplicationController
  def index
    if !params[:search].empty?
      debugger
    else
      @books = Book.all
      render "index"
    end

  end

  def show
    @book = Book.find(params[:id])
    redirect_to
  end
end
