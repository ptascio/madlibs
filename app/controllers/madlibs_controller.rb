class MadlibsController < ApplicationController

  def index
    @madlibs = Madlib.all
    render 'index'
  end

  def show
    @madlib = Madlib.find(params[:id])
    render 'show'
  end

end
