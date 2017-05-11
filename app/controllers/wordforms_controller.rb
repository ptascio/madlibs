class WordformsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    @wordform = Wordform.find(params[:id])
    # gsub"\n", "" then split(", ") gets length
    render "show"
  end

  def edit
    @wordform = Wordform.find(params[:id])
    @madlib = Madlib.find_by_id(@wordform.madlib_id)
  end

  def update
    #params[:wordform][:misswords]
    @wordform = Wordform.find(params[:id])
    @wordform.misswords = params[:wordform][:misswords]
    @wordform.save
    render "show"
  end

  def destroy
  end
end
