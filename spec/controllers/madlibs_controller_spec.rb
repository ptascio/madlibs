require "rails_helper"

RSpec.describe MadlibsController, :type => :controller do

  describe "POST #create" do
    before do
      Book.create!(title: "The First Book")
    end
    it "requires book_id params" do
      post :create, params: {:book_id => 1, :madlib => {title: "Num 1", story: "I like _noun_", book_id: 1}}
      expect(Madlib.count).to be(1)
    end

    it "requires title params" do
      post :create, params: {:book_id => 1, :madlib => {title: "", story: "I like _noun_", book_id: 1}}
      expect(response).to redirect_to('/books/1/madlibs/new')
    end

    it "requires story to have missing words" do
      post :create, params: {:book_id => 1, :madlib => {title: "Cake!", story: "I like cake", book_id: 1}}
      expect(response).to redirect_to('/books/1/madlibs/new')
    end

    it "creates a wordform for the story" do
      post :create, params: {:book_id => 1, :madlib => {title: "Cake!", story: "I like _cake_", book_id: 1}}
      expect(Wordform.first.madlib_id).to be(Madlib.first.id)
    end
  end

end
