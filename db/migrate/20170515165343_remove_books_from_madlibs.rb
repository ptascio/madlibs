class RemoveBooksFromMadlibs < ActiveRecord::Migration[5.0]
  def change
    remove_reference :madlibs, :books, foreign_key: true
  end
end
