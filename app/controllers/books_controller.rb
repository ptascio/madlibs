class BooksController < ApplicationController
  def index
    if !params[:search].nil? && !params[:search].empty?
      @books = Book.search(params[:search])
      params[:search] = ""
    elsif !current_user.nil?
      @books = Book.where(:user_id => nil, :exclusive => 0).all
      @user_books = Book.where(:user_id => current_user.id)
      @exclusive_books = Book.where(:exclusive => 1)
    else
      @books = Book.where(:user_id => nil, :exclusive => 0).all
    end
    render "index"
  end

  def show
    @book = Book.find(params[:id])
    render "show"
  end

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @already_have_title = Book.find_by_title(params[:book][:title])
    if @already_have_title
      redirect_to new_book_path, :flash => { :error => "There is already a book by that name. Choose a different name." }
    elsif params[:book][:title].length < 1
      redirect_to new_book_path, :flash => { :error => "Looks like you haven't entered a title yet!" }
    else
      @book = Book.new(book_params)
      @book.user_id = @user.id
      @book.save
      redirect_to book_madlibs_path(@book)
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :user_id)
  end
end
