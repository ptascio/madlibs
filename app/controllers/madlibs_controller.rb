class MadlibsController < ApplicationController

  def index
    @madlibs = Madlib.where("book_id" => params[:book_id])
    @book = Book.find(params[:book_id])
    render 'index'
  end

  def show
    @madlib = Madlib.find(params[:id])
    render 'show'
  end

  def new
    @book = Book.find(params[:book_id])
    @madlib = Madlib.new
  end

  def create
    title = params[:madlib][:title]
    story = params[:madlib][:story]
    debugger
    if title.empty? || story.empty? || title.nil? || story.nil?
      redirect_to new_book_madlib_path, :flash => { :error => "Make sure both title and story are filled in." }
    else
      @madlib = Madlib.new(madlib_params)
      if !@madlib.check_user_story
        redirect_to new_book_madlib_path, :flash => { :error => "It doesn't look like you left out any words.
          Make sure each word you want to leave out begins and ends with a _ ." }
      end
    end
  end

  def update
    @madlib = Madlib.find(params[:id])
    story = @madlib.array_story
    @madlib.story = @madlib.populate_story(story);
    render 'show'
  end

  def edit
    @madlib = Madlib.find(params[:id])
    @madlib.wordform.misswords = nil
    @madlib.wordform.save!
    @madlib.misswords = nil
    @madlib.save!
    # render "show"
    redirect_to wordform_path
  end

  def madlib_params
    params.require(:madlib).permit(:title, :story)
  end

end
