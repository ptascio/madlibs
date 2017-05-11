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
  end

  def update
  end

  def destroy
  end
end
