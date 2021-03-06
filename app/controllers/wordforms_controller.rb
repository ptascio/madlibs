class WordformsController < ApplicationController
  def index
  end

  def new
    @madlib = Madlib.find(params[:madlib])
  end

  def create
    #this is in the Madlib model
    #when user creates a story wordform is automatically created
    @wordform = Wordform.new
    @wordform.madlib_id = params[:madlib_id]
    @madlib = Madlib.find(params[:madlib_id])
    @wordform.words = @wordform.make_user_form(@madlib)
    @wordform.save!
    @madlib.wordform = @wordform
    @madlib.save!
    redirect_to wordform_path(@wordform.id, @madlib)
  end

  def show
    @wordform = Wordform.find(params[:id])
    @madlib = Madlib.find_by_id(@wordform.madlib_id)
    @wordform.count = @madlib.count_missing_words
    @wordform.save!
    render "show"
  end

  def edit
    @wordform = Wordform.find(params[:id])
    @madlib = Madlib.find_by_id(@wordform.madlib_id)
  end

  def update
    @wordform = Wordform.find(params[:id])
    @madlib = Madlib.find_by_id(@wordform.madlib_id)
    user_submission = params[:misswords]
    if @wordform.check_if_empty(user_submission)
      render "show"
    elsif @wordform.check_over_under(user_submission)
      @wordform.misswords = user_submission
      render "show"
    else
      @wordform.misswords = user_submission.join(", ")
      @wordform.save!
      @madlib = Madlib.find_by_id(@wordform.madlib_id)
      @madlib.wordform = @wordform
      @madlib.save!
      render "edit"
    end
  end

  def destroy
  end
end
