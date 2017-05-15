class AddBookToMadlibs < ActiveRecord::Migration[5.0]
  def change
    add_reference :madlibs, :book, foreign_key: true
  end
end
