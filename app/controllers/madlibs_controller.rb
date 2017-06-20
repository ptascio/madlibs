class MadlibsController < ApplicationController

  def index
    @madlibs = Madlib.where("book_id" => params[:book_id])
    @book = Book.find(params[:book_id])
    render 'index'
  end

  def show

    @madlib = Madlib.find(params[:id])
    if (!@madlib.wordform.misswords.nil?)
      story = @madlib.array_story
      @madlib.story = @madlib.populate_story(story)
    end
    render 'show'
  end

  def new
    @book = Book.find(params[:book_id])
    @madlib = Madlib.new
  end

  def create
    title = params[:madlib][:title]
    story = params[:madlib][:story]
    if title.empty? || story.empty? || title.nil? || story.nil?
      redirect_to new_book_madlib_path, :flash => { :error => "Make sure both title and story are filled in." }
    else
      @madlib = Madlib.new(madlib_params)
      if !@madlib.check_user_story
        redirect_to new_book_madlib_path, :flash => { :error => "It doesn't look like you left out any words.
          Make sure each word you want to leave out begins and ends with a _ ." }
      else
        @madlib.book_id = params[:madlib][:book_id]
        @madlib.save!
        redirect_to controller: 'wordforms', action: 'new', madlib: @madlib
      end
    end
  end

  def update
    if params[:commit]
      @madlib = Madlib.find(params[:book_id])
      story = @madlib.array_story
      @madlib.story = @madlib.populate_story(story);
      render 'show'
    end
  end

  def edit
    @madlib = Madlib.find(params[:id])
    @book = Book.find(params[:book_id])
    if params[:reset]
      @madlib.wordform.misswords = nil
      @madlib.wordform.save!
      @madlib.misswords = nil
      @madlib.save!
    # render "show"
      redirect_to wordform_path(@madlib.wordform.id)
    else
      render "edit"
    end
  end

  def destroy
  end

  def madlib_params
    params.require(:madlib).permit(:title, :story, :book_id)
  end

end
