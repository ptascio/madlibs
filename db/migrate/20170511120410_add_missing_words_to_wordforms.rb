class AddMissingWordsToWordforms < ActiveRecord::Migration[5.0]
  def change
    add_column :wordforms, :misswords, :string
  end
end
