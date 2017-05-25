class BooksController < ApplicationController
  def index
    if !params[:search].nil? && !params[:search].empty?
      @books = Book.search(params[:search])
      debugger
    else
      @books = Book.all
    end
    render "index"
  end

  def show
    @book = Book.find(params[:id])
    redirect_to
  end
end
