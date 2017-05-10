class MadlibsController < ApplicationController

  def index
    @madlibs = Madlib.all
  end

  def show
    @madlib = Madlib.find(params[:id])
    render 'show'
  end

end
