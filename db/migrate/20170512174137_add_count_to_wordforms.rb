class AddCountToWordforms < ActiveRecord::Migration[5.0]
  def change
    add_column :wordforms, :count, :integer
  end
end
