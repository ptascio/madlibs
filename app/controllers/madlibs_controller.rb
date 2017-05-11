class MadlibsController < ApplicationController

  def index
    @madlibs = Madlib.all
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
    render "show"
  end

end
