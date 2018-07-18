class AddPriceToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :price, :integer
  end
end
