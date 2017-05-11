class AddMissingWordsToMadlibs < ActiveRecord::Migration[5.0]
  def change
    add_column :madlibs, :misswords, :string
  end
end
