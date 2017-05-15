class MadlibsController < ApplicationController

  def index
    @madlibs = Madlib.where("book_id" => params[:book_id])
    render 'index'
  end

  def show
    @madlib = Madlib.find(params[:id])
    render 'show'
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

end
