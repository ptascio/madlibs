require "rails_helper"

RSpec.describe Book, :type => :model do
  describe "#search" do
    it "finds book by title" do
      new_book = Book.create!(title: "Lost Book")
      found_book = Book.search("Lost Book")
      expect(found_book[0]).to eq(new_book)
    end

    it "returns nil if book is not found" do
      find_book = Book.search("Does Not Exist")
      expect(find_book[0]).to eq(nil)
    end
  end

  describe "#user_search" do
    it "locates books based on current_user" do
      new_book = Book.create!(title: "Todd's Book")
      todd_user = User.create!(username: "Todd", password: "password")
      new_book.user_id = todd_user.id
      new_book.save!
      todds_book = Book.user_search("Todd's book", todd_user.id)
      expect(todds_book[0].user_id).to eq(todd_user.id)
    end

    it "returns exclusive books if current_user_id" do
      special_book = Book.create!(title: "Exclusive Book", exclusive: 1)
      regular_book = Book.create!(title: "Regular Book", exclusive: 0)
      todd_book = Book.create!(title: "Todd's Book")
      todd_user = User.create!(username: "Todd", password: "password")
      todd_book.user_id = todd_user.id
      todd_book.save!
      todds_ex_book = Book.user_search("Exclusive", todd_user.id)
      expect(todds_ex_book[0].title).to eq("Exclusive Book")
    end

    it "won't return exclusive books if no current_user_id" do

    end
  end

end
