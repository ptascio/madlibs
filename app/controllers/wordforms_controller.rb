class WordformsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @wordform = Wordform.find(params[:id])
    render "show"
  end

  def edit
    @wordform = Wordform.find(params[:id])
    @madlib = Madlib.find_by_id(@wordform.madlib_id)
  end

  def update
    #params[:wordform][:misswords]
    @wordform = Wordform.find(params[:id])
    @wordform.validate_submission(params[:wordform][:misswords])
    if params[:wordform][:misswords].empty?
      debugger
      render "show"
    else
      @wordform.misswords = params[:wordform][:misswords]
      @wordform.save!
      @madlib = Madlib.find_by_id(@wordform.madlib_id)
      render "edit"
    end
  end

  def destroy
  end
end
