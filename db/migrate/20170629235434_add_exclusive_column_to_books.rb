class AddExclusiveColumnToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :exclusive, :integer, default: 0 
  end
end
