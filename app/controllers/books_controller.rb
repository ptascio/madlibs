class BooksController < ApplicationController
  def index
    if !params[:search].nil? && !params[:search].empty?
      @books = Book.search(params[:search])
      params[:search] = ""
    else
      @books = Book.all
    end
    render "index"
  end

  def show
    @book = Book.find(params[:id])
    redirect_to
  end

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @already_have_title = Book.find_by_title(params[:title])
    if @already_have_title
      render json: "There is already a book by that name. Choose a different name."
    else
      render "new"
    end
  end
end
