class MadlibsController < ApplicationController

  def index
    @madlibs = Madlib.all
  end

  def show
    @madlib = Madlib.find(params[:id])
  end

end
