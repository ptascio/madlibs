class CreateWordforms < ActiveRecord::Migration[5.0]
  def change
    create_table :wordforms do |t|
      t.text :words

      t.timestamps
    end
  end
end
