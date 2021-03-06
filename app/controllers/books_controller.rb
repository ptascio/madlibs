class BooksController < ApplicationController
  def index
    if !params[:search].nil? && !params[:search].empty?
      @search = true
      if current_user.nil?
        @books = Book.search(params[:search])
      elsif !current_user.nil?
        @books = Book.user_search(params[:search], current_user.id)
      end
      params[:search] = ""
    elsif !current_user.nil?
      @books = Book.where(:user_id => nil, :exclusive => 0).all
      @shared_user_books = Book.where(:user_id => !nil, :exclusive => 0)
      @user_books = Book.where(:user_id => current_user.id)
      @exclusive_books = Book.where(:exclusive => 1, :user_id => nil)
    else
      @books = Book.where(:user_id => nil, :exclusive => 0).all
      @shared_user_books = Book.where(:user_id => !nil, :exclusive => 0)
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

  def update
    @book = Book.find(params[:id])
    if params[:exclusive] == "true"
      @book.exclusive = 1
      @book.save!
      redirect_to book_madlibs_path(@book.id)
    elsif params[:exclusive] == "false"
      @book.exclusive = 0
      @book.save!
      redirect_to book_madlibs_path(@book.id)
    end
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
      @book.author = @user.username
      @book.exclusive = 1
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
