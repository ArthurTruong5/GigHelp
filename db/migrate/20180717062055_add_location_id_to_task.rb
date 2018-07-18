class AddLocationIdToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :location_id, :integer
  end
end
