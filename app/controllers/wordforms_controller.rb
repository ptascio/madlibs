class WordformsController < ApplicationController
  def index
  end

  def new
  end

  def create
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
    user_submission = params[:wordform][:misswords]
    if @wordform.check_if_empty(user_submission)
      render "show"
    elsif @wordform.check_over_under(user_submission)
      @wordform.misswords = user_submission
      render "show"
    else
      @wordform.misswords = user_submission
      @wordform.save!
      @madlib = Madlib.find_by_id(@wordform.madlib_id)
      render "edit"
    end
  end

  def destroy
  end
end
