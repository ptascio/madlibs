require "rails_helper"

RSpec.describe BooksController, :type => :controller do
  before do
    @mary = User.create!(username: "Mary", password: "password")
    @exc_book = Book.create!(title: "Exclusive Book", exclusive: 1)
    @reg_book = Book.create!(title: "Regular Book", exclusive: 0)
    @reg2_book = Book.create!(title: "Regular Book 2", exclusive: 0)
    @mary_book = Book.create!(title: "Mary's Book", exclusive: 0, user_id: "#{@mary.id}")
  end

  describe "GET index if current_user" do
    let(:user) { User.create!(username: "Todd", password: 'password') }
    before { allow(controller).to receive(:current_user) { user } }
    before do
      @todd_book = Book.create!(title: "Todd's Book", exclusive: 1, user_id: "#{user.id}")
    end
    it "finds all standard books" do
      books = Book.where(:user_id => nil, :exclusive => 0)
      expect(books.length).to eq(2)
    end

    it "finds exclusive books" do
      if user
        ex_books = Book.where(:user_id => nil, :exclusive => 1)
        expect(ex_books.length).to eq(1)
      end
    end

    it "finds shared books" do
      if user
        shared_books = Book.where(:user_id => !nil, :exclusive => 0)
        expect(shared_books.length).to eq(1)
      end
    end
  end

  describe "GET index if current_user.nil?" do
    before do
      @user = nil
    end
    it "finds all standard books" do
      books = Book.where(:user_id => nil, :exclusive => 0)
      expect(books.length).to eq(2)
    end

    it "finds does not find exclusive books" do
      if @user
        ex_books = Book.where(:user_id => nil, :exclusive => 1)
      end
        expect(ex_books).to eq(nil)
    end

    it "finds shared books" do
        shared_books = Book.where(:user_id => !nil, :exclusive => 0)
        expect(shared_books.length).to eq(1)
    end

    it "does not find users books if user.nil?" do
      unless !@user
        books = Book.where(:user_id => "#{@user.id}")
      end
      expect(books).to eq(nil)
    end
  end
end
