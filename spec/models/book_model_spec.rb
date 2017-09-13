require "rails_helper";

RSpec.describe Book, :type => :model do
  describe "#search" do
    it "has a title" do
      new_book = Book.create!(title: "Lost Book")
      found_book = Book.search("Lost Book")
      expect(found_book[0]).to eq(new_book)
    end

    it "returns nil if book is not found" do
      find_book = Book.search("Does Not Exist")
      expect(find_book[0]).to eq(nil)
    end
  end
end
