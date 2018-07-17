class RemoveLocationIdFromTask < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :location_id, :integer
  end
end
