class AddMadlibToWordforms < ActiveRecord::Migration[5.0]
  def change
    add_reference :wordforms, :madlib, foreign_key: true
  end
end
