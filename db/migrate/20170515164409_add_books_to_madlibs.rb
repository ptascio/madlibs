class AddBooksToMadlibs < ActiveRecord::Migration[5.0]
  def change
    add_reference :madlibs, :books, foreign_key: true
  end
end
