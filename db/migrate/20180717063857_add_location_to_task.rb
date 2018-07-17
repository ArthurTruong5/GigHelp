class AddLocationToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :location, :string
  end
end
